import 'package:flutter/material.dart';

//my own imports
import './homepage/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "My App",
      home: Welcome(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
