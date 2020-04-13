import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {

  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {

  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () {
          setState(() {
            animate = true;
          });
        }
      ),
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: Center(
          child: ZoomOut(
            animate: animate,
            from: 30,
            duration: Duration(seconds: 1),
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 40
            ),
          ),
        )
     ),
   );
  }
}