import 'dart:math';

import 'package:crud/data/dummy_user.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier{
  final Map<String,User> _items ={...DUMMY_USERS};

  // lista completa o clone
  List<User> get all{
    return [..._items.values];
    }

  /// tamanho
  int get count{
    return _items.length;
  }

  //item 
  User  byindex(int index){
     
    return _items.values.elementAt(index);
  
  }
  //inseri na lista

  void put(User user){
    if(user == null){
      return ;
    }


    if(user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)){
      _items.update(user.id, (value) =>  User(
      id:user.id,
      name: user.name,
      avatarUrl: user.avatarUrl,
      email:user.email
     ),);
    }else{

    final id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => User(
      id:id,
      name: user.name,
      avatarUrl: user.avatarUrl,
      email:user.email
     ),
    );
    }
   

    notifyListeners();
  }

  void remove(User user){
    
    if(user != null ){
      _items.remove(user.id);

    }
    notifyListeners();
  }

}