import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_out/main.dart';

class GymNames extends StatefulWidget
{
  @override
  GymNameState createState() => GymNameState();
}

class GymNameState extends State<GymNames>
{
  final gymNames = <String>['Crux', 'Boulder', 'Klimzaal Wallstreet',
    'Klimzaal Blok'];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gym List"),
      ),
      body: buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddGymWindow())
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }

  Widget buildList()
  {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: gymNames.length,
      itemBuilder: (BuildContext context, int index)
      {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text('${gymNames[index]}', style: TextStyle(fontSize: 21.0)),
        );
      },
    );
  }
}