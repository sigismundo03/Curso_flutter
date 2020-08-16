import 'package:flutter/material.dart';
import '../util/approutes.dart';

class ManDrawer extends StatelessWidget {

  Widget _creatItem(IconData icon, String label,Function ontap ){
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: ontap ,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomRight,
            child: Text(
              "Vamos cozinha",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color:Theme.of(context).primaryColor,
                
              ),
              ),
          ),
          SizedBox(height: 05,),
          _creatItem(
            Icons.restaurant, 
            "Refeições",
            ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.Home),
          ),
          _creatItem(
            Icons.settings,
           "Refeições",
           ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.Settings),
           ),
          
        ],
      ),
      
    );
  }
}