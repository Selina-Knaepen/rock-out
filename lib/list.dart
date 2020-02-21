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
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Gym List"),
        backgroundColor: Color.fromRGBO(150, 182, 249, 1.0),
        leading: IconButton(icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () => scaffoldKey.currentState.openDrawer(),
        ),
      ),
      body: buildList(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 75.0,
              child: DrawerHeader(
                child: Text(
                  "Rock Out",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(150, 182, 249, 1.0),
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // TODO: Add functionality
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddGymWindow())
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(181, 152, 240, 1.0),
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