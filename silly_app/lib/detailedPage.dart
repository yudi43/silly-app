import 'package:flutter/material.dart';
import 'package:silly_app/Model/character.dart';
import 'package:silly_app/components/checkout_dialog.dart';

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
          child: Column(
        children: <Widget>[
          Container(
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: widget.characterToShow.photo,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3.0,
                    child: CheckoutDialog(
                      itemName: "Beer",
                      itemCost: "20",
                      itemImage: Image.asset(
                        "assets/beer.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
