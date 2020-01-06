import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/screens/HotelCarousal.dart';
import 'package:travel_ui/screens/TopDestinations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.parachuteBox,
    FontAwesomeIcons.biking
  ];
  int _selectedIcon = 0;

  @override
  Widget build(BuildContext context) {
    Widget _makeIcons(int index) {
      return new GestureDetector(
        onTap: () {
          setState(() {
            _selectedIcon = index ;
          });
        },
        child: new Container(
          width: 60.0,
          height: 60.0,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: _selectedIcon == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
          ),
          child: new Icon(_icons[index], color: Colors.blueGrey.shade600),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: new SafeArea(
        child: new ListView(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 90),
              child: new Text(
                "What would you like to find?",
                style: new TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new SizedBox(height: 20.0,),
            new Row(
              mainAxisAlignment:  MainAxisAlignment.spaceAround,
              children: _icons.asMap().entries.map((MapEntry map) => _makeIcons(map.key)).toList() 
            ),
            new SizedBox(height: 15.0,),
            TopDestination(),
            new SizedBox(height: 15.0,),
            HotelCarousal()
          ],
        ),
      ),
    );
  }
}
