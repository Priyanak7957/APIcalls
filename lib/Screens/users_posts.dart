import 'package:flutter/material.dart';
import 'package:test/Screens/add_post.dart';
import 'package:test/Screens/post_list.dart';
import 'package:test/bloc/user_bloc.dart';
import 'package:test/model/all_posts_model.dart';
import 'package:test/widgets/appBar.dart';
import 'package:test/widgets/navigation.dart';

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
          var data = snapshot.data;
          return data == null
              ? Container(width: 0.0, height: 0.0)
              : PostsList(data: data);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => nextPage(context, AddPostScreem(id: widget.id)),
        backgroundColor: Colors.black87.withOpacity(0.8),
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
    );
  }
}
