import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:shop/exceptions/authexecption.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;

  bool get isAut {
    return toke != null;
  }

  String get userId{
    return  isAut ? _userId: null;
  }
  String get toke {
    String newToke;
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      newToke = _token;
    }

    return newToke;
  }

  Future<void> _auth(String email, String password, String tipo) async {
    final _url = "";

    final response = await http.post(
      _url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseBody = json.decode(response.body);

    if (responseBody["error"] != null) {
      throw AuthException(responseBody["error"]["message"]);
    } else {
      _token = responseBody["idToken"];
      _userId = responseBody["localId"];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseBody["expiresIn"]),
        ),
      );
      notifyListeners();
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    return _auth(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    return _auth(email, password, "signInWithPassword");
  }

  void logout() {
    _token = null;
    _userId  = null;
    _expiryDate  = null;
    notifyListeners();
  }
}
 