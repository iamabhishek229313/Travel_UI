import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination_model.dart';

class DestinationDetails extends StatefulWidget {
  Destination des;
  DestinationDetails({this.des});
  @override
  _DestinationDetailsState createState() => _DestinationDetailsState();
}

class _DestinationDetailsState extends State<DestinationDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
      children: <Widget>[
        new Stack(
          children: <Widget>[
            new Container(
              height: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
              child: new Hero(
                tag: widget.des.imageUrl,
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: new Image(
                    image: new AssetImage(widget.des.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30.0),
                  child: new IconButton(
                    icon: new Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 30.0),
                      child: new IconButton(
                        icon: new Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 30.0),
                      child: new IconButton(
                        icon: new Icon(
                          FontAwesomeIcons.sortAmountDown,
                          color: Colors.black,
                          size: 25.0,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            new Positioned(
              bottom: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                width: MediaQuery.of(context).size.width,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(widget.des.city,
                        style: new TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            letterSpacing: 1.2)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Icon(
                              FontAwesomeIcons.locationArrow,
                              color: Colors.grey,
                              size: 15.0,
                            ),
                            new SizedBox(width: 10.0,),
                            new Text(widget.des.country,
                                style: new TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 14.0))
                          ],
                        ),
                        new Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 30.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
