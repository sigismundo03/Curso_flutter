import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/exceptions/authexecption.dart';
import 'package:shop/providers/auth.dart';

enum AuthMode { Singup, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _formkey = GlobalKey();
  bool _isloading = false;
  AuthMode _authMode = AuthMode.Login;
  final _passwordControlle = TextEditingController();
  Map<String,String> _authData = {
    'email': ' ',
    'password': ' ',
  };
  
  void _showErrorDialog(String messagemdeError){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Ocorreu um error"),
          content: Text(messagemdeError),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop(false);
              }, 
              child: Text("Fechar"), 
            ),
          ],
        );
      }
    );

  }

  Future<void> _submit() async{
    if(!_formkey.currentState.validate()){
      return ;
    }

    setState(() {
       _isloading = true;
    
    });

    _formkey.currentState.save();

    Auth auth = Provider.of(context, listen: false);
    try{
       if(_authMode == AuthMode.Login){
      await auth.login(_authData["email"], _authData["password"]);
      ///login
    }else{
      await auth.signup(_authData["email"], _authData["password"]);
      ///Cadastro
    }
    } on AuthException catch(error){
        _showErrorDialog(error.toString());
    } 

   
      
     setState(() {
       _isloading = false;
    
    });


  }
    
  void _switchauthMode(){
    setState(() {
      if(_authMode == AuthMode.Singup){
        _authMode = AuthMode.Login;
      }else{
          _authMode =  AuthMode.Singup;
      }
    
    });

  }



  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: _authMode == AuthMode.Singup ? 200 : 460,
        width: deviceSize.width * 0.60,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "E-mail",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value.trim().isEmpty || !value.contains('@')){
                  return "email invalido";
                }
                return null;
              },
              onSaved: (value) => _authData['email'] = value,
            ),

            TextFormField(
              decoration: InputDecoration(
                labelText: "Senha",
              ),
              controller: _passwordControlle,
              obscureText:  true,
              keyboardType: TextInputType.visiblePassword,
              validator: (value){
                if(value.trim().isEmpty){
                  return "senha invalido";
                }
                return null;
              },

              onSaved: (value) => _authData['password'] = value,
            ),

            if(_authMode == AuthMode.Singup)
              TextFormField(
              decoration: InputDecoration(
                labelText: "Comfimar a Senha",
              ),
              obscureText:  true,
              keyboardType: TextInputType.visiblePassword,
              validator: _authMode == AuthMode.Singup ?(value){
                if(value.trim().isEmpty || value != _passwordControlle.text){
                  return "senha invalido";
                }
                return null;
              }: null,

             
            ),
          
          Spacer(),
          _isloading ? CircularProgressIndicator() :
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryTextTheme.button.color,
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 8.0,
            ),
           child:Text( _authMode == AuthMode.Login ? 'Login':'Cadastrar'),
           onPressed: _submit,
          ),
          FlatButton(
            onPressed: _switchauthMode, 
            child:Text( _authMode == AuthMode.Singup ? 'Login':'Cadastrar'),
          ),
          ],
        ),),
      ),
    );
  }
}
