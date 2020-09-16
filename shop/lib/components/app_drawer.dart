import 'package:flutter/material.dart';
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
                AppRoutes.HOME,
              );
            },
            
            
          ),
          
           ListTile(
            leading: Icon(Icons.payment,),
            title: Text('Loja'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ORDERS,
              );
            },
           ),
             ListTile(
            leading: Icon(Icons.edit),
            title: Text('Gerecia Produtos'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.PRODUCT,
              );
            },
           ),
        
        ],
        
      ),
    );
  }
}