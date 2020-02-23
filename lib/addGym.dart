import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_out/main.dart';
import 'package:rock_out/repositories/mockGymRepository.dart';

import 'models/gym.dart';

class AddGym extends StatefulWidget
{
  @override
  AddGymState createState() => AddGymState();
}

class AddGymState extends State<AddGym>
{
  final formKey = GlobalKey<FormState>();
  MockGymRepository _gymRepository = new MockGymRepository();
  Gym gym;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  void createGym(String name, String address, String website) {
    if (address.isEmpty) {
      address = "Unknown";
    }

    if (website.isEmpty) {
      website = "Unknown";
    }

    gym = new Gym(name, address, website);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
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
  }

  Widget buildForm()
  {
    return SingleChildScrollView(
      child: Form(
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
              validator: (value) {
                if (value.isEmpty) {
                  return "You can't have an empty name";
                }
                return null;
              },
              controller: nameController,
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
              controller: addressController,
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
              controller: websiteController,
              decoration: const InputDecoration(
                hintText: "Enter the gym website",
                hintStyle: TextStyle(fontSize: 14),
              ),
              cursorColor: Color.fromRGBO(181, 152, 240, 1.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: RaisedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  createGym(nameController.text, addressController.text, websiteController.text);
//                  _gymRepository.addGym(gym);
                  _sendResultBack(context);
//                  Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => RockOutMain()));
                }
              },
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    ),
    );
  }

  void _sendResultBack(BuildContext context) {
    Navigator.pop(context, gym);
  }
}