import 'package:flutter/material.dart';

nextPage(context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
