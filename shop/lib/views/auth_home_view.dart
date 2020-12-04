import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';

import 'authview.dart';
import 'produtooverview_viwes.dart';

class AuthHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return FutureBuilder(
         future:auth.tryAutoLogin(),
         builder: (context, snapshot){
           if( snapshot.connectionState == ConnectionState.waiting){
             return Center(
                  child: CircularProgressIndicator()
             );
           }else{
            return auth.isAut ? ProdutoOverviewViewes() : AuthView();
           }
         }
        
        );
  }
}
