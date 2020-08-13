import 'package:cook/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailView extends StatelessWidget {

Widget _createSectionTitle(BuildContext context, String title){
  return  Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
}

Widget _createSectionContainer(Widget child){
  return Container(
              height: 250,
              width: 300,
              padding: const EdgeInsets.all(10),
              margin: const  EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10) , 
                color: Colors.white,
                border: Border.all(color: Colors.grey)
                ),
              child:child,
  );
}

  @override
   Widget build(BuildContext context) {
     final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
              
              ),
              _createSectionTitle(context,"Ingrendientes"),
              _createSectionContainer(
                 ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                          ),
                        child: Text(meal.ingredients[index]),
                      ),
                      color: Theme.of(context).accentColor,
                    );
                   },             
                  ),

             ),
             _createSectionTitle(context,"Passos"),
             _createSectionContainer(
                 ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                              child: Text("${index + 1}"),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                       Divider(),
                      ],
                    
                    );
                   },             
                  ),

             ),
          ],
        ),
      ),
      
    );
  }
}