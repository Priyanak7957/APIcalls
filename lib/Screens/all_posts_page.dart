import 'package:flutter/material.dart';
import 'package:test/Screens/add_post_page.dart';
import 'package:test/Screens/post_list_view.dart';
import 'package:test/bloc/user_bloc.dart';
import 'package:test/model/all_posts_model.dart';
import 'package:test/widgets/appBar.dart';
import 'package:test/widgets/navigation.dart';

class AllPostsPage extends StatefulWidget {
  final String id;
  AllPostsPage({Key key, this.id}) : super(key: key);

  @override
  _AllPostsPageState createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  UserBloc _userBloc = UserBloc();
  @override
  void initState() {
    _userBloc.getAllPostsList(widget.id);
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
        onPressed: () => nextPage(context, AddPostPage(id: widget.id)),
        backgroundColor: Colors.black87.withOpacity(0.8),
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
    );
  }
}
