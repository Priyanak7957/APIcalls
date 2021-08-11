import 'package:flutter/material.dart';

OutlineInputBorder borderOutline = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: BorderSide(
    color: Colors.green,
    width: 2,
  ),
);

customTextField(TextEditingController controller, String label, {int maxLine}) {
  return Theme(
    data: new ThemeData(primarySwatch: Colors.green),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: borderOutline,
        labelText: "Post title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLines: maxLine ?? 1,
    ),
  );
}
