import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/screens/DestinationDetails.dart';

class TopDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                'Top Destinations',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              new GestureDetector(
                onTap: () {
                  print("see all");
                },
                child: new Text("See all",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 300.0,
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              Destination des = destinations[index];
              return new GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DestinationDetails(
                              des: des,
                            ))),
                child: new Container(
                  // margin: EdgeInsets.all(0.0),
                  width: 200.0,
                  child: new Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      new Positioned(
                        bottom: 10.0,
                        child: new Container(
                          width: 190.0,
                          height: 110.0,
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  '${des.activities.length} activities',
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2),
                                ),
                                new SizedBox(
                                  height: 10.0,
                                ),
                                new Text(des.description,
                                    style: new TextStyle(
                                        color: Colors.grey, fontSize: 12.0))
                              ],
                            ),
                          ),
                        ),
                      ),
                      new Positioned(
                        top: 10.0,
                        child: new Stack(
                          children: <Widget>[
                            new Hero(
                              tag: des.imageUrl,
                              child: new ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: new Image(
                                  height: 160.0,
                                  width: 160.0,
                                  image: AssetImage(des.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            new Positioned(
                              left: 5.0,
                              bottom: 5.0,
                              child: new Column(
                                children: <Widget>[
                                  new Text(
                                    des.city,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2),
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      new Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color: Colors.grey,
                                      ),
                                      new SizedBox(width: 10.0),
                                      new Text(
                                        des.country,
                                        style:
                                            new TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
