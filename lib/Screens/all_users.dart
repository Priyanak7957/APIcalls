import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test/Screens/users_posts.dart';
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
          return snapshot.data == null
              ? Container(width: 0.0, height: 0.0)
              : ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UsersPosts(id: snapshot.data[index].id)),
                          );
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data[index].avatar,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/profile.png',
                                  height: 30.0,
                                  width: 30.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(snapshot.data[index].name)
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
