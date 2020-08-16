import 'package:flutter/material.dart';
import '../components/man_dawer.dart';
import '../models/settengs.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var settings = Settengs();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: ManDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Configurações",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  "Sem Glutén",
                  "Só exibe refeições sem Glutén",
                  settings.isGlutenFree,
                  (valeu) => setState(
                    () => settings.isGlutenFree = valeu,
                  ),
                ),
                _createSwitch(
                  "Sem Lactose",
                  "Só exibe refeições sem Lactose",
                  settings.isGlutenFree,
                  (valeu) => setState(
                    () => settings.isLactoseFree = valeu,
                  ),
                ),
                _createSwitch(
                  "Sem Lactose",
                  "Só exibe refeições sem Lactose",
                  settings.isGlutenFree,
                  (valeu) => setState(
                    () => settings.isLactoseFree = valeu,
                  ),
                ),
                _createSwitch(
                  "Vegana",
                  "Só exibe refeições veganas",
                  settings.isVegan,
                  (valeu) => setState(
                    () => settings.isVegan = valeu,
                  ),
                ),
                _createSwitch(
                  "Vegetariana",
                  "Só exibe refeições Vegetarianas",
                  settings.isVegetarian,
                  (valeu) => setState(
                    () => settings.isVegetarian = valeu,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
