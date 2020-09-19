import 'package:flutter/material.dart';

class Character {
  String name;
  String net_worth;
  Image photo;

  Character({this.name, this.net_worth, this.photo});

  factory Character.fromDetails({String name, String netWorth, Image photo}) {
    return Character(name: name, net_worth: netWorth, photo: photo);
  }
}
