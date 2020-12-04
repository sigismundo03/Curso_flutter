import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:shop/data/store.dart';
import 'package:shop/exceptions/authexecption.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;
  Timer _logoutTimer;

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

      Store.saveMap('userData', {
        "token": _token,
        "userId": _userId,
        "expiryDate":_expiryDate,

      });
      _autlogout();
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


  Future<void> tryAutoLogin() async{
    if(isAut){
      return Future.value();
    }

    final userData = await Store.getMap("userData");

    if(userData == null){
      return Future.value();
    }
    final expiryData = DateTime.parse( userData["expiryData"]);

    if(expiryData.isBefore(DateTime.now())){
      return Future.value();
    }

    _userId = userData["userId"];
    _token = userData["token"];
    _expiryDate = expiryData;
    _autlogout();
    notifyListeners();
    return Future.value();

  }
  void logout() {
    _token = null;
    _userId  = null;
    _expiryDate  = null;
    if( _logoutTimer != null){
      _logoutTimer.cancel();
      _logoutTimer = null;
    }
    Store.remove("userData");
    notifyListeners();
  }
  void  _autlogout() {
    if( _logoutTimer != null){
       _logoutTimer.cancel();

    }
    final timeToLogout = _expiryDate.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout),logout);
  }
}
 