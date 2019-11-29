import 'package:flutter/material.dart';

import 'roca_modelo.dart';
final azul = new Color.fromRGBO(40, 52, 150, 1);
final naranja = new Color.fromRGBO(255, 145, 0, 1);
class RockDetailPage extends StatefulWidget {
  final Roca roca;

  RockDetailPage(this.roca);

  @override
  _RockDetailPageState createState() => _RockDetailPageState();
}

class _RockDetailPageState extends State<RockDetailPage> {
  // Arbitrary size choice for styles
  final double rockAvatarSize = 150.0;
  //double _sliderValue = 10.0;
  String renderUrl;
  Widget get rockImage {
    renderUrl = widget.roca.imagen;
    // Containers define the size of its children.
    return Image.asset(renderUrl);/*Container(
      height: rockAvatarSize,
      width: rockAvatarSize,
      // Use Box Decoration to make the image a circle
      // and add an arbitrary shadow for styling.
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width -100,backgroundColor: Colors.transparent,
        child: ClipOval(
          child: Image.asset(
            renderUrl,
          ),
        ),
      ),
    );*/
  }
  // The rating section that says ★ 10/10.
  Widget get rating {
    // Use a row to lay out widgets horizontally.
    return Row(
      // Center the widgets on the main-axis
      // which is the horizontal axis in a row.
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          color: naranja,
          size: 40.0,
        ),
        Text(' ${widget.roca.rating} / 10',
            style: TextStyle(color: naranja,fontSize: 40),),
      ],
    );
  }

  // The widget that displays the image, rating and dog info.
  Widget get rockProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        // This would be a great opportunity to create a custom LinearGradient widget
        // that could be shared throughout the app but I'll leave that to you.
        color: Colors.white,
        /*gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),*/
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.white,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              20.0, 20.0, 20.0, 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              rockImage,
              Text(
                '${widget.roca.name}  👀',
                style: TextStyle(fontSize: 32.0, color: naranja),
              ),
              Text(
                widget.roca.location,
                style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
              ),
              Text(widget.roca.description, style: TextStyle(color: Colors.grey[800], fontSize: 20.0),textAlign: TextAlign.justify,),
              /*Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                child: Text(widget.roca.description, style: TextStyle(color: Colors.grey[800], fontSize: 20.0),),
              ),*/
              Text('\$'+
                widget.roca.precio.toString(),
                style: TextStyle(fontSize: 35.0, color: Colors.blue[800]),
              ),
              rating
            ],
          ),
        ),
      ),
    );
  }

 /* Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.deepOrangeAccent,
                  min: 0.0,
                  max: 10.0,
                  onChanged: (newRating) {
                    setState(() => _sliderValue = newRating);
                  },
                  value: _sliderValue,
                ),
              ),
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text('${_sliderValue.toInt()}',
                    style: TextStyle(color: Colors.grey[900], fontSize: 32)),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }
  void updateRating() {
    setState(() => widget.roca.rating = _sliderValue.toInt());
  }

  Widget get submitRatingButton {
    return RaisedButton(
        onPressed: updateRating,
      child: Text('Guardar'),
      color: Colors.orangeAccent,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    // This is a new page, so you need a new Scaffold!
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: azul,
        title: Text('Acerca de ${widget.roca.name}'),
      ),
      body: ListView(
        children: <Widget>[rockProfile/*, addYourRating*/],
      ),
    );
  }
}
