import 'dart:io';

enum AuthMode{
  LOGIN,
  SIGNUP,
}

class AuthDATA {
  String name;
  String email;
  String password;
  AuthMode _mode =  AuthMode.LOGIN;
  File image;
  

  bool get isSignup{
    return  _mode ==  AuthMode.SIGNUP;

  }
  
  bool get isLogin{
    return  _mode ==  AuthMode.LOGIN;

  }

  void toggleMode(){
    _mode = _mode ==  AuthMode.LOGIN ?  AuthMode.SIGNUP:  AuthMode.LOGIN;
  }

}