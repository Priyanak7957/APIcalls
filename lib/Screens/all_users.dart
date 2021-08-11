import 'package:flutter/material.dart';
import 'package:test/model/user_model.dart';
import 'package:test/user_bloc.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        title: Text(
          "Users",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: _userBloc.userListStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<UserModel>> asyncSnapshot) {
              return asyncSnapshot.data == null
                  ? Container(width: 0.0, height: 0.0)
                  : ListView.builder(
                      itemCount: asyncSnapshot.data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              print(asyncSnapshot.data[index].id);
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    asyncSnapshot.data[index].avatar,
                                    height: 30.0,
                                    width: 30.0,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace stackTrace) {
                                      return Image.asset(
                                        'assets/profile.png',
                                        height: 30.0,
                                        width: 30.0,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(asyncSnapshot.data[index].name)
                              ],
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
