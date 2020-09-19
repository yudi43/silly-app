import 'package:flutter/material.dart';
import 'package:silly_app/Model/character.dart';
import 'package:silly_app/Model/item.dart';
import 'package:silly_app/components/checkout_dialog.dart';

class DetailedScreen extends StatefulWidget {
  final Character characterToShow;

  DetailedScreen({this.characterToShow});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  int netWorthLeft;
  List<Items> itemList;

  void populateList() {
    itemList = [
      new Items.fromDetails(
          itemName: "Rafale",
          worth: "91000000",
          photo: Image.asset("assets/item/rafale.png"),
          addCallBack: addValue,
          subCallBack: subValue),
      new Items.fromDetails(
        itemName: "Rafale",
        worth: "91000000",
        photo: Image.asset("assets/item/rafale.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "5",
      ),
      new Items.fromDetails(
          itemName: "Rafale",
          worth: "91000000",
          photo: Image.asset("assets/item/rafale.png"),
          addCallBack: addValue,
          subCallBack: subValue),
      new Items.fromDetails(
        itemName: "Rafale",
        worth: "91000000",
        photo: Image.asset("assets/item/rafale.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "5",
      ),
      new Items.fromDetails(
          itemName: "Rafale",
          worth: "91000000",
          photo: Image.asset("assets/item/rafale.png"),
          addCallBack: addValue,
          subCallBack: subValue),
      new Items.fromDetails(
        itemName: "Rafale",
        worth: "91000000",
        photo: Image.asset("assets/item/rafale.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "5",
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    populateList();
    netWorthLeft = int.parse(widget.characterToShow.net_worth);
  }

  void addValue(int value) {
    setState(() {
      netWorthLeft += value;
    });
  }

  void subValue(int value) {
    setState(() {
      netWorthLeft -= value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.characterToShow.name),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: widget.characterToShow.photo,
                ),
              ),
              Text(
                "\$" + netWorthLeft.toString(),
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3.0,
                    child: CheckoutDialog(
                        addCallback: addValue,
                        subtractCallback: subValue,
                        itemName: itemList[index].itemName,
                        itemCost: itemList[index].worth,
                        itemImage: itemList[index].photo,
                    limit: itemList[index].limit,),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
