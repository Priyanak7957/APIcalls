import 'dart:async';

import 'package:test/model/all_posts_model.dart';
import 'package:test/model/user_model.dart';
import 'package:test/network/requsts.dart';
import 'package:test/network/api_list.dart';

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

  void getAlluser() {
    _network.getReq(allUserAPI).then((value) {
      value.map((i) => userModel.add(UserModel.fromJson(i))).toList();
      userListStreamSink.add(userModel);
    });
  }

  void getAllPost(String id) {
    _network.getReq("$allUserAPI/$id/posts").then((value) {
      value.map((i) => allPostModel.add(AllPost.fromJson(i))).toList();
      postListStreamSink.add(allPostModel);
    });
  }

  distroy() {
    _userListStreamController.close();
    _postListStreamController.close();
  }
}
