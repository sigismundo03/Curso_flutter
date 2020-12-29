import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';


class PlacesListScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus lugares"),
         actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),

      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ? 
        Center(
          child: CircularProgressIndicator(),
        ): Consumer<GreatPlaces>(
        
          child:Center(
            child: Text('Nenhum local cadastrado'),
            
          ),
            builder: (context,greatPlaces,  childtext) => greatPlaces.coutItems == 0 ?
            childtext
            : 
            ListView.builder(
             itemCount: greatPlaces.coutItems,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(
                  greatPlaces.itemByIndex(index).imagen,
                ),
              ),
              title: Text( greatPlaces.itemByIndex(index).title),
              onTap: (){},
            ),
              
            ),
        ),
      ),
      
    );
  }
}