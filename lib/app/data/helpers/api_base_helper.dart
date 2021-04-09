import 'dart:convert';
import 'dart:io';
import 'package:bottom_nav_test/app/data/exceptions/exceptions.dart';
import 'package:bottom_nav_test/config/config.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
// Get Request
  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.https(Config.API_URL, url));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No network');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

// POST Request
  Future<dynamic> post(String url, Object body) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response =
          await http.post(Uri.https(Config.API_URL, url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post recieved!');
    return responseJson;
  }

// Response Handling
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
