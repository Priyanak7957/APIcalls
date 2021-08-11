import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test/Screens/users_posts.dart';
import 'package:test/model/user_model.dart';
import 'package:test/widgets/navigation.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<UserModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () => nextPage(context, UsersPosts(id: data[index].id)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: data[index].avatar,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/profile.png',
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(data[index].name)
              ],
            ),
          ),
        );
      },
    );
  }
}
