import 'package:flutter/material.dart';

import 'list.dart';
import 'addGym.dart';

void main() => runApp(RockOutMain());

class RockOutMain extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Rock Out',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(181, 152, 240, 1.0),
        primaryTextTheme: Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.white)
       ),
      home: GymNames()
    );
  }
}

class AddGymWindow extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: AddGym(),
    );
  }
}