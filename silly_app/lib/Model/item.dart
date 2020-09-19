import 'package:flutter/material.dart';

class Items {
  String itemName;
  String worth;
  Image photo;
  String limit;
  Function (int value) addCallBack ;
  Function (int value) subCallBack ;


  Items({this.itemName, this.worth, this.photo,this.limit,this.addCallBack, this.subCallBack});

  factory Items.fromDetails({String itemName, String worth, Image photo,String limit,Function addCallBack, Function subCallBack}) {
    return Items(itemName: itemName, worth: worth, photo: photo,limit: limit, addCallBack: addCallBack, subCallBack: subCallBack);
  }
}
