import 'package:flutter/material.dart';
import 'package:test/model/all_posts_model.dart';

class PostsList extends StatelessWidget {
  const PostsList({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<AllPost> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
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
                  data[index].title,
                  style: TextStyle(fontSize: 21),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(data[index].body),
              ],
            ),
          ),
        );
      },
    );
  }
}
