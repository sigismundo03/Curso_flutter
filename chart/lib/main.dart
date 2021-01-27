import 'package:chart/screens/auth_screen.dart';
import 'package:chart/screens/chat_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

   final Future<FirebaseApp> _init = Firebase.initializeApp();

    return FutureBuilder(
        future: _init,
        builder: (context,appShapshot){
         return MaterialApp(
          title: 'Flutter Chart',
          theme: ThemeData(
          
          primarySwatch: Colors.pink,
          backgroundColor: Colors.pink,
          accentColor: Colors.purple,
          accentColorBrightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.pink,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ), 
          ),
        ),
        home:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnaphot){

            if(userSnaphot.hasData){
              return ChatScreen();
            }else{
               return  AuthScreen();
            }
          }


        
        ),
      );
      }
        
    );
  }
}
