import 'package:flutter/material.dart';
import 'package:silly_app/Model/character.dart';

class DetailedScreen extends StatefulWidget {
  final Character characterToShow;
  DetailedScreen({this.characterToShow});
  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: widget.characterToShow.photo,
        ),
      ),
    );
  }
}
