import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/classes/activity_class.dart';
import 'package:flutter_application_1/views/pages/onboarding.dart';
import 'package:flutter_application_1/views/widgets/hero_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Future<Activity> _futureActivity; 

  @override
  void initState() {
    super.initState();
    _futureActivity = getData(); // 👈 assign once
  }

  Future<Activity> getData() async {
    var url = Uri.https('bored-api.appbrewery.com', '/random', {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Activity.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load activity');
    }
  }

  Future<Activity> fetchActivity() async {
    final url = Uri.parse('https://bored-api.appbrewery.com/random');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Activity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load activity');
    }
  }
    void _refresh() {
    setState(() {
      _futureActivity = fetchActivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Suggestion"),
        centerTitle: true,
      ),
      body: FutureBuilder<Activity>(
        future: _futureActivity,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            final activity = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedCrossFade(
                firstChild: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.activity,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Type: ${activity.type}"),
                      Text("Participants: ${activity.participants}"),
                      Text("Duration: ${activity.duration}"),
                      Text("Kid Friendly: ${activity.kidFriendly ? 'Yes' : 'No'}"),
                      Text("Accessibility: ${activity.accessibility}"),
                      Text("Price: ${activity.price}"),
                      const SizedBox(height: 10),
                      if (activity.link.isNotEmpty)
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Learn more: ${activity.link}",
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: _refresh,
                          icon: const Icon(Icons.refresh),
                          label: const Text("Get New Activity"),
                        ),
                      ),
                    ],
                  ),
                ),
              ), secondChild: Center(child: Image.asset('assets/images/bg.jpg'),), crossFadeState: CrossFadeState.showFirst, duration: Duration(milliseconds: 300))
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
