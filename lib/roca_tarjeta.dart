import 'package:flutter/material.dart';

import 'roca_modelo.dart';
final naranja = new Color.fromRGBO(255, 145, 0, 1);
final azul = new Color.fromRGBO(40, 52, 150, 1);
class RoCard extends StatefulWidget {
  final Roca roca;

  RoCard(this.roca);

  @override
  _RoCardState createState() => _RoCardState(roca);
}

class _RoCardState extends State<RoCard> {
  Roca roca;

  _RoCardState(this.roca);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 115.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50.0,
              child: RoCard,
            ),
            Positioned(top: 7.5, child: RocaImagen),
          ],
        ),
      ),
    );
  }

  Widget get RoCard {
    // A new container
    // The height and width are arbitrary numbers for styling.
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.white60,
        // Wrap children in a Padding widget in order to give padding.
        child: Padding(
          // The class that controls padding is called 'EdgeInsets'
          // The EdgeInsets.only constructor is used to set
          // padding explicitly to each side of the child.
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          // Column is another layout widget -- like stack -- that
          // takes a list of widgets as children, and lays the
          // widgets out from top to bottom.
          child: Column(
            // These alignment properties function exactly like
            // CSS flexbox properties.
            // The main axis of a column is the vertical axis,
            // `MainAxisAlignment.spaceAround` is equivalent of
            // CSS's 'justify-content: space-around' in a vertically
            // laid out flexbox.
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.roca.name,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(widget.roca.location,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,color: naranja,
                  ),
                  Text(': ${widget.roca.rating} / 10',
                      style: TextStyle(color: naranja, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String renderUrl;

Widget get RocaImagen {
  return Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
          'http://lorempixel.com/200/200/cats',
        ),
      ),
    ),
  );
}