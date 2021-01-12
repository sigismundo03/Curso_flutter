import 'package:chart/models/auth_data.dart';
import 'package:chart/widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState>_saffoldkey = GlobalKey<ScaffoldState>();

  Future<void> _hadleSubmit(AuthDATA authDATA) async {
    try{
      if (authDATA.isLogin) {
      await _auth.signInWithEmailAndPassword(
        email: authDATA.email.trim(),
        password: authDATA.password.trim(),
      );
    } else {
      await _auth.createUserWithEmailAndPassword(
        email: authDATA.email.trim(),
        password: authDATA.password.trim(),
      );
    }
    }on PlatformException catch(error){
      final msg = error.message ?? 'Ocorreu um erro verifique seu dados';
      _saffoldkey.currentState.showSnackBar(
          SnackBar(
          content:Text(msg),
          backgroundColor: Theme.of(context).errorColor,

  ),
	

);
    }catch(erro){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _saffoldkey,
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_hadleSubmit),
    );
  }
}
