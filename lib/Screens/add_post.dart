import 'package:flutter/material.dart';
import 'package:test/bloc/user_bloc.dart';
import 'package:test/widgets/appBar.dart';

class AddPostScreem extends StatefulWidget {
  final String id;
  AddPostScreem({Key key, this.id}) : super(key: key);

  @override
  _AddPostScreemState createState() => _AddPostScreemState();
}

class _AddPostScreemState extends State<AddPostScreem> {
  TextEditingController titleText = TextEditingController();
  TextEditingController bodyText = TextEditingController();
  OutlineInputBorder borderOutline = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(
      color: Colors.green,
      width: 2,
    ),
  );

  UserBloc _userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customApp("Add Post"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Theme(
                data: new ThemeData(primarySwatch: Colors.green),
                child: TextField(
                  controller: titleText,
                  decoration: InputDecoration(
                    border: borderOutline,
                    labelText: "Post title",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Theme(
                data: new ThemeData(primarySwatch: Colors.green),
                child: TextField(
                  controller: bodyText,
                  decoration: InputDecoration(
                    border: borderOutline,
                    labelText: "Post title",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  maxLines: 7,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.green.shade200),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white), //Background Color
                    elevation: MaterialStateProperty.all(3), //Defines Elevation
                    shadowColor: MaterialStateProperty.all(
                        Colors.black), //Defines shadowColor
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Add Post',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onPressed: () {
                  if (titleText.text.isNotEmpty && bodyText.text.isNotEmpty) {
                    _userBloc.postArt(titleText.text, bodyText.text, widget.id);
                    titleText.clear();
                    bodyText.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
