import 'package:flutter/material.dart';
import '../views/category_view.dart';
import '../views/favorite_view.dart';
import '../components/man_dawer.dart';
import '../models/meal.dart';

class TabsView extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsView(this.favoriteMeals);

  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedViewindex = 0;
  List<Map<String, Object>> _view;

  @override
  void initState() {
    super.initState();
    _view = [
      {
        "title": "Categorias",
        "view": CategoryView(),
      },
      {
        "title": "Lista de favoritos",
        "view": FavoriteView(widget.favoriteMeals),
      },
    ];
  }

  _selectedView(int index) {
    setState(() {
      _selectedViewindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_view[_selectedViewindex]["title"]),
      ),
      body: _view[_selectedViewindex]["view"],
      drawer: ManDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedView,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedViewindex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Categoria"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text("Favoritos"),
          )
        ],
      ),
    );
  }
}
