import 'package:flutter/material.dart';

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
  
  void _submit(){
    if(!_formkey.currentState.validate()){
      return ;
    }

    setState(() {
       _isloading = true;
    
    });

    _formkey.currentState.save();

    if(_authMode == AuthMode.Login){
      ///login
    }else{
      ///cadastra
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
        height: _authMode == AuthMode.Singup ? 232 : 360,
        width: deviceSize.width * 0.75,
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
                if(value.trim().isEmpty || value.contains('@')){
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
