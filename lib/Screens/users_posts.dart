import 'package:flutter/material.dart';
import 'package:test/bloc/user_bloc.dart';
import 'package:test/model/all_posts_model.dart';
import 'package:test/widgets/appBar.dart';

class UsersPosts extends StatefulWidget {
  final String id;
  UsersPosts({Key key, this.id}) : super(key: key);

  @override
  _UsersPostsState createState() => _UsersPostsState();
}

class _UsersPostsState extends State<UsersPosts> {
  UserBloc _userBloc = UserBloc();
  @override
  void initState() {
    _userBloc.getAllPost(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customApp("Posts"),
      body: StreamBuilder(
        stream: _userBloc.postListStream,
        builder: (context, AsyncSnapshot<List<AllPost>> snapshot) {
          return snapshot.data == null
              ? Container(width: 0.0, height: 0.0)
              : ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data[index].title,
                              style: TextStyle(fontSize: 21),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(snapshot.data[index].body),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black87.withOpacity(0.8),
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
    );
  }
}
