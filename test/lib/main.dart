import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Simple GridView")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2, // 👈 2 items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(6, (index) {
              return Container(
                padding: EdgeInsets.all(16),
                color: Colors.amber,
                child: Center(
                  child: Text("Item $index", style: TextStyle(fontSize: 18)),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
