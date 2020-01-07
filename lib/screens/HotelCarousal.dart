import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/models/hotel_model.dart';

class HotelCarousal extends StatelessWidget {
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
                'Exclusive Hotels',
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
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              Hotel hotel = hotels[index];
              return new Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: 300.0,
                child: new Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    new Positioned(
                      bottom: 10.0,
                      child: new Container(
                        width: 300.0,
                        height: 110.0,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                '${hotel.name}',
                                style: new TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2),
                              ),
                              new SizedBox(
                                height: 10.0,
                              ),
                              new Text(hotel.address,
                                  style: new TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                              new SizedBox(height: 5.0,),
                              new Text(
                                '\$${hotel.price} / night',
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 12.0 , fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Positioned(
                      top: 10.0,
                      child: new Stack(
                        children: <Widget>[
                          new ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: new Image(
                              height: 160.0,
                              width: 240.0,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
