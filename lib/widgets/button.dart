import 'package:flutter/material.dart';

customButton(String text, {var onPressed}) {
  return TextButton(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.green.shade200),
      backgroundColor:
          MaterialStateProperty.all(Colors.white), //Background Color
      elevation: MaterialStateProperty.all(3), //Defines Elevation
      shadowColor:
          MaterialStateProperty.all(Colors.black), //Defines shadowColor
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        '$text',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    onPressed: onPressed,
  );
}
