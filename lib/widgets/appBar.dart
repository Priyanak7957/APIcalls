import 'package:flutter/material.dart';

AppBar customApp(String name) {
  return AppBar(
    title: Text(
      "$name",
      style: TextStyle(color: Colors.black87),
    ),
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 5,
  );
}
