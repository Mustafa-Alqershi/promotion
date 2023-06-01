import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Api {
  static final Api _singleton = Api._internal();
  final String _baseUrl = 'http://192.168.0.162:8000/api/';
  late http.Client _client;
  late String _token;
  factory Api() {
    return _singleton;
  }

  Api._internal() {
    _client = http.Client();
    _token = '';
  }

  setToken(String token) {
    _token = token;
  }

  Future<dynamic> get(String path) async {
    var toke = GetStorage().read("token");
    if (toke != null) {
      print('token in client');
      print(toke);
      _token = toke;
    }
    final response = await _client.get(Uri.parse('$_baseUrl$path'), headers: {
      'Authorization': 'Bearer $_token',
      "Accept": 'application/json'
    });
    return response;
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    var toke = GetStorage().read("token");
    if (toke != null) {
      print('token in client post');
      print(toke);
      _token = toke;
    }
    final response = await _client.post(Uri.parse('$_baseUrl$path'),
        headers: {
          'Authorization': 'Bearer $_token',
          "Accept": 'application/json'
        },
        body: data);
    return response;
  }

  Future<dynamic> delete(String path) async {
    var toke = GetStorage().read("token");
    if (toke != null) {
      print('token in client delete');
      print(toke);
      _token = toke;
    }
    final response = await _client.delete(Uri.parse('$_baseUrl$path'),
        headers: {'Authorization': 'Bearer $_token'});
    return response;
  }

  Future<dynamic> put(String path, Map<String, dynamic> data) async {
    var toke = GetStorage().read("token");
    if (toke != null) {
      _token = toke;
    }
    final response = await _client.put(Uri.parse('$_baseUrl$path'),
        headers: {
          'Authorization': 'Bearer $_token',
          "Accept": 'application/json'
        },
        body: data);
    return response;
  }
}
