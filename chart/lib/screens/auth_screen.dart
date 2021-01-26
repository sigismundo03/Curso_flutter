import 'package:chart/models/auth_data.dart';
import 'package:chart/widgets/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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


  bool _isLoading = false;

  void satstateIsLaoding(){
    setState(() {
      _isLoading =!_isLoading;
      
    });
    
  }

  Future<void> _hadleSubmit(AuthDATA authDATA) async {

    satstateIsLaoding();
    AuthResult authResult;
    try{
      if (authDATA.isLogin) {
      authResult = await _auth.signInWithEmailAndPassword(
        email: authDATA.email.trim(),
        password: authDATA.password.trim(),
      );
    } else {
      authResult = await _auth.createUserWithEmailAndPassword(
        email: authDATA.email.trim(),
        password: authDATA.password.trim(),
      );

      final userData = {
        'name': authDATA.name,
        'email': authDATA.email,

      };
      await Firestore.instance.collection('users').document(authResult.user.uid).setData(userData);


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

  }finally{
    satstateIsLaoding();
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _saffoldkey,
      backgroundColor: Theme.of(context).primaryColor,
      // body: AuthForm(_hadleSubmit),
      body: Center(
        child: SingleChildScrollView(
                  child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  AuthForm(_hadleSubmit),
                  if(_isLoading)
                  Positioned.fill(
                    
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                      child: Center(
                        child: CircularProgressIndicator(),
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
