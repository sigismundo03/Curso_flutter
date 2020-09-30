import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:shop/exceptions/authexecption.dart';

class Auth with ChangeNotifier{

  

  Future<void> _auth( String email, String password, String tipo) async{
    final _url = "";

    final response = await http.post(_url, body: json.encode({
      "email": email,
      "password":password,
      "returnSecureToken": true,
    }),);
   

   final responseBody = json.decode(response.body);

   if(responseBody["error"] != null){
    throw AuthException(responseBody["error"]["message"]);

   }
    return Future.value();
  }

  Future<void> signup( String email, String password) async{
      return  _auth(email, password,"signUp");
  }

  Future<void> login( String email, String password) async{
    return  _auth(email, password,"signInWithPassword");
  }

}