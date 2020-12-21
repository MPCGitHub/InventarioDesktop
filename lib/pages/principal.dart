import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<Widget> containers = [
    Container(
      color: Colors.blue[300],
    ),
    Container(
      color: Colors.deepOrange[300],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inventário Alert'),
        ),
        ),
    );
  }
}
