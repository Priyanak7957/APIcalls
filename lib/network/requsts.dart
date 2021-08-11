import 'package:dio/dio.dart';

class Network {
  final _baseURl = "https://609b59ee2b549f00176e34df.mockapi.io/api";

  Dio dio = Dio();

  Future getReq(query) async {
    try {
      Response getResponse = await dio.get('$_baseURl$query');
      return getResponse.data;
    } catch (e) {
      return e.response.data;
    }
  }
}
