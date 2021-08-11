import 'dart:async';

import 'package:test/model/all_posts_model.dart';
import 'package:test/model/user_model.dart';
import 'package:test/network/requsts.dart';

class UserBloc {
  Network _network = Network();

  List<UserModel> userModel = <UserModel>[];

  List<AllPost> allPostModel = <AllPost>[];

  //---------------------For user lists--------------------->

  final StreamController<List<UserModel>> _userListStreamController =
      StreamController<List<UserModel>>.broadcast();

  StreamSink<List<UserModel>> get userListStreamSink =>
      _userListStreamController.sink;

  Stream<List<UserModel>> get userListStream =>
      _userListStreamController.stream;

  //---------------------For posts lists--------------------->

  final StreamController<List<AllPost>> _postListStreamController =
      StreamController<List<AllPost>>.broadcast();

  StreamSink<List<AllPost>> get postListStreamSink =>
      _postListStreamController.sink;

  Stream<List<AllPost>> get postListStream => _postListStreamController.stream;

  //---------------------End---------------------->

  void getAllUsersList() {
    _network.getReq(_network.allUserAPI).then((value) {
      value.map((i) => userModel.add(UserModel.fromJson(i))).toList();
      userListStreamSink.add(userModel);
    });
  }

  void getAllPostsList(String id) {
    _network.getReq("${_network.allUserAPI}/$id/posts").then((value) {
      value.map((i) => allPostModel.add(AllPost.fromJson(i))).toList();
      postListStreamSink.add(allPostModel);
    });
  }

  void postArt(String title, String body, String id) {
    Map<String, dynamic> mapBody = Map<String, dynamic>();
    mapBody["title"] = title;
    mapBody["body"] = body;
    String api = "${_network.allUserAPI}/$id/posts";
    _network.postReq(mapBody, api).then((value) {});
  }

  destroy() {
    _userListStreamController.close();
    _postListStreamController.close();
  }
}
