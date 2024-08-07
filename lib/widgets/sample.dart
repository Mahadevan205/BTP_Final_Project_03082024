import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Dropdowns'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 200, // Set a fixed width for the dropdown
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: 'Select FY',
                  items: ['Select FY', 'FY2023', 'FY2024'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    print(newValue);
                  },
                  icon: Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.blue),
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
              SizedBox(
                width: 152, // Set a fixed width for the dropdown
                height: 30,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    // border: InputBorder.none,
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue)
                    ),
                    filled: true,
                    hintText: 'Select Year',
                  //  hintStyle,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5)
                  ),
                  value: 'Select Region',
                  items: ['Select Region', 'Region A', 'Region B']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    print(newValue);
                  },
                  icon: Icon(Icons.arrow_drop_down_circle,
                      color: Colors.blue),
                  iconSize: 15.0,
                  style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


