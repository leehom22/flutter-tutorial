import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.teal,
                  height: 20.0,
                  child: Text("Hello"),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.amber,
                  height: 20.0,
                  child: Text("Hello Flexible "),
                ),
              ),
            ],
          ), // Expanded will take the whole screen . Use inside Column or Row
          Divider(),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.amber,
                  height: 20.0,
                  child: Text("Hello Flexible "),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.teal,
                  height: 20.0,
                  child: Text("Hello"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
