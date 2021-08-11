import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:test/Screens/all_users_page.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AllUsersPage(),
    );
  }
}
