import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropdownSelector(),
    );
  }
}

class DropdownSelector extends StatefulWidget {
  @override
  _DropdownSelectorState createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  String? selectedItem;
  final List<String> fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Pineapple'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riba's Simple Dropdown Selector",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 178, 254),
      ),
      backgroundColor: const Color.fromARGB(255, 210, 236, 250),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Select a Fruit from the list below",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedItem,
                hint: Text('Select a fruit'),
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue;
                  });
                },
                items: fruits.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                selectedItem == null
                    ? 'No fruit selected'
                    : 'Selected: $selectedItem',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
