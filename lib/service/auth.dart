import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode/model/user_model.dart';

class Auth{
 static Future signIn({ required  context,required String email, required String password}) async {
    try {


 const baseUrl = "http://192.168.18.72:8000/";

     String url = 'http://192.168.18.72:8000/user/login';

  Uri uri = Uri.parse(url);
print(email);
 http.Response response = await http.post(uri,
      headers: {'Content-Type': 'application/json'}, body: json.encode({
        // "email":email,
        // "password":password

          "email": 'mohsin@gamil.com',
  "password": password
      }));
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:


        print(response.body);
          var data = await jsonDecode(response.body);


          // storeUserTokenInSharedPref(data['accessToken']);
          UserModel? rNetUser =  UserModel.fromJson(data['data']);
          return rNetUser;
          // return 200;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }





   static Future saveAttendance({ required  context,required String userId, required String url}) async {
    try {




     String baseUrl = 'http://192.168.18.72:8000/user/saveAttendance';

  Uri uri = Uri.parse(baseUrl);
print(url.toString() +'aaaaaaaaaaaaaaaaaa');
 http.Response response = await http.post(uri,
      headers: {'Content-Type': 'application/json'}, body: json.encode({
        // "email":email,
        // "password":password

          "userId": userId,
  "url": url,
  "Date":DateTime.now().toIso8601String()
      }));
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:


        print(response.body);
          var data = await jsonDecode(response.body);


          // storeUserTokenInSharedPref(data['accessToken']);
       SnackBar(content: Text('Marked'));
          return 200;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }





    static Future getAttendance({ required  context}) async {
    try {
         const snackdemo = SnackBar(
            content: Text('downloaded'),
            backgroundColor: Colors.green,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );




     String baseUrl = 'http://192.168.18.72:8000/user/getAllAttendance';

  Uri uri = Uri.parse(baseUrl);

 http.Response response = await http.get(uri,
      headers: {'Content-Type': 'application/json'});
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:

          ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        print(response.body);
          var data = await jsonDecode(response.body);


          // storeUserTokenInSharedPref(data['accessToken']);
       SnackBar(content: Text('Marked'));
          return data['data'];
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}



class NoInternetException {
  String message;
  NoInternetException(this.message);
}

class NoServiceFoundException {
  String message;
  NoServiceFoundException(this.message);
}

class InvalidFormatException {
  String message;
  InvalidFormatException(this.message);
}

class UnknownException {
  String message;
  UnknownException(this.message);
}
