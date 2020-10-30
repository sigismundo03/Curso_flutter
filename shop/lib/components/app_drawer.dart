import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import '../utils/app_routes.dart';

class APPDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bem Usuario!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Loja'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.AUTH,
              );
            },
            
            
          ),
           Divider(),
           ListTile(
            leading: Icon(Icons.payment,),
            title: Text('Loja'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ORDERS,
              );
            },
           ),
           Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Gerecia Produtos'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.PRODUCT,
              );
            },
           ),
          
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: (){
             Provider.of<Auth>(context, listen: false).logout();
            },
           ),
        
        ],
        
      ),
    );
  }
}