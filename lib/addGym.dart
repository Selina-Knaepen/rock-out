import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddGym extends StatefulWidget
{
  @override
  AddGymState createState() => AddGymState();
}

class AddGymState extends State<AddGym>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Gym"),
      ),
    );
  }
}