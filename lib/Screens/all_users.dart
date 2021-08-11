import 'package:flutter/material.dart';
import 'package:test/Screens/users_list_view.dart';
import 'package:test/model/user_model.dart';
import 'package:test/bloc/user_bloc.dart';
import 'package:test/widgets/appBar.dart';

class AllUsersPage extends StatefulWidget {
  AllUsersPage({Key key}) : super(key: key);

  @override
  _AllUsersPageState createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.getAlluser();
    super.initState();
  }

  @override
  void dispose() {
    _userBloc.distroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customApp("Users"),
      body: StreamBuilder(
        stream: _userBloc.userListStream,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          var data = snapshot.data;
          return data == null
              ? Container(width: 0.0, height: 0.0)
              : UsersList(data: data);
        },
      ),
    );
  }
}
