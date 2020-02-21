import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_out/main.dart';

class AddGym extends StatefulWidget
{
  @override
  AddGymState createState() => AddGymState();
}

class AddGymState extends State<AddGym>
{
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
          appBar: AppBar(
            title: Text(
              "Add Gym",
            ),
            leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
              color: Colors.white,
            ),
            backgroundColor: Color.fromRGBO(150, 182, 249, 1.0),
          ),
          body: buildForm()
      ),
    );

//    onPressed: () => Navigator.push(context,
//        MaterialPageRoute(builder: (context) => RockOutMain())),
  }

  Widget buildForm()
  {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child:
            Text(
              "Name:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child:
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter the gym name",
                hintStyle: TextStyle(fontSize: 14),
              ),
              cursorColor: Color.fromRGBO(181, 152, 240, 1.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child:
            Text(
              "Address:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child:
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter the gym address",
                hintStyle: TextStyle(fontSize: 14),
              ),
              cursorColor: Color.fromRGBO(181, 152, 240, 1.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child:
            Text(
              "Website:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child:
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter the gym website",
                hintStyle: TextStyle(fontSize: 14),
              ),
              cursorColor: Color.fromRGBO(181, 152, 240, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}