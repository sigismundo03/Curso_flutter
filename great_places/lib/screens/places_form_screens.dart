import 'package:flutter/material.dart';

class PlacesFormScreen extends StatefulWidget {
  @override
  _PlacesFormScreenState createState() => _PlacesFormScreenState();
}

class _PlacesFormScreenState extends State<PlacesFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo lugar'),
      ),
      body: Center(
        child: Text('forms'),
      ),
    );
  }
}
