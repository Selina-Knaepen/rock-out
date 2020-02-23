import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_out/main.dart';
import 'package:rock_out/models/gym.dart';
import 'package:rock_out/repositories/mockGymRepository.dart';

class GymNames extends StatefulWidget
{
  @override
  GymNameState createState() => GymNameState();
}

class GymNameState extends State<GymNames>
{
  MockGymRepository _gymRepository = new MockGymRepository();
  List<Gym> gyms;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context)
  {
    gyms = _gymRepository.gyms;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Gym List"),
        backgroundColor: Color.fromRGBO(150, 182, 249, 1.0),
        leading: IconButton(icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
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
          _awaitReturnValueAddGymScreen(context);
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => AddGymWindow())
//          );
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
      itemCount: gyms.length,
      itemBuilder: (BuildContext context, int index)
      {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text('${gyms[index].name}', style: TextStyle(fontSize: 21.0)),
        );
      },
    );
  }

  void _awaitReturnValueAddGymScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddGymWindow()));
    setState(() {
      _gymRepository.addGym(result);
      gyms = _gymRepository.gyms;
    });
  }
}