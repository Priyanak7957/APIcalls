import 'dart:async';

import 'package:test/model/user_model.dart';
import 'package:test/network.dart';
import 'package:test/network/api_list.dart';

class UserBloc {
  Network _network = Network();

  List<UserModel> userModel = <UserModel>[];

  final StreamController<List<UserModel>> _userListStreamController =
      StreamController<List<UserModel>>.broadcast();

  StreamSink<List<UserModel>> get userListStreamSink =>
      _userListStreamController.sink;

  Stream<List<UserModel>> get userListStream =>
      _userListStreamController.stream;

  void getAlluser() {
    _network.getReq(allUserAPI).then((value) {
      value.map((i) => userModel.add(UserModel.fromJson(i))).toList();
      userListStreamSink.add(userModel);
    });
  }

  distroy() {
    _userListStreamController.close();
  }
}
