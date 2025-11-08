import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/expanded_flexible_page.dart';

class SettingPge extends StatefulWidget {
  const SettingPge({super.key, required this.title});

  final String title;

  @override
  State<SettingPge> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPge> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem = "Element 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ), // need widget. to access StatefulWidget properties
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Snackbar"),duration: Duration(seconds: 5),behavior: SnackBarBehavior.floating,));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text("Open Snackbar"),
              ),
              Divider(
                color: Colors.teal,
                thickness: 2.0,
                endIndent: 200.0,
              ),
           
              ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("Alert Title"),
                      content: Text("Alert Content"),
                      actions: [
                        FilledButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("Close"))
                      ],
                    );
                  },);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text("Open Dialog"),
              ),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(
                    value: "Element 1",
                    child: Text("Element 1"),
                  ),
                  DropdownMenuItem(
                    value: "Element 2",
                    child: Text("Element 2"),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(controller.text),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile(
                tristate: true,
                title: Text("Open Snackbar"),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              // .adaptive makes the seitch adapt to the platform (eg: IOS)
              SwitchListTile.adaptive(
                title: Text("Switch Me"),
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider.adaptive(
                max: 100,
                divisions: 10,
                value: sliderValue,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              Text("Slider Value: ${sliderValue.toStringAsFixed(2)}"),
              InkWell(
                onTap: () {
                  // Make image clickable
                  print("Image selected");
                },
                splashColor: Colors.white12,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              ElevatedButton(onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ExpandedFlexiblePage();
                        },
                      ),
                    );
              }, child: Text("Show Flexible and Expanded")),
              FilledButton(onPressed: () {}, child: Text("Click Me")),
              TextButton(onPressed: () {}, child: Text("Click Me")),
              OutlinedButton(onPressed: () {}, child: Text("Click Me")),
              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
