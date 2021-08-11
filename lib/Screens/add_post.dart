import 'package:flutter/material.dart';
import 'package:test/bloc/user_bloc.dart';
import 'package:test/widgets/appBar.dart';
import 'package:test/widgets/button.dart';
import 'package:test/widgets/textField.dart';

class AddPostScreem extends StatefulWidget {
  final String id;
  AddPostScreem({Key key, this.id}) : super(key: key);

  @override
  _AddPostScreemState createState() => _AddPostScreemState();
}

class _AddPostScreemState extends State<AddPostScreem> {
  TextEditingController titleText = TextEditingController();
  TextEditingController bodyText = TextEditingController();

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
              customTextField(titleText, "Post title"),
              SizedBox(height: 40),
              customTextField(bodyText, "Post body", maxLine: 7),
              SizedBox(height: 20),
              customButton(
                "Add Post",
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
