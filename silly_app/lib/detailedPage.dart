import 'package:flutter/material.dart';
import 'package:silly_app/Model/item.dart';
import 'package:silly_app/components/checkout_dialog.dart';

import 'Model/character.dart';

class DetailedScreen extends StatefulWidget {
  final Character characterToShow;

  DetailedScreen({this.characterToShow});
  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  int netWorthLeft;
  List<Items> itemList;
  Map<String, int> valueMapper;
  List<Widget> summaryWidgets = new List<Widget>();

  void populateList() {
    itemList = [
      new Items.fromDetails(
        itemName: "Jhola (CarryBag)",
        worth: "0",
        photo: Image.asset("assets/item/Jhola (CarryBag).png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "1",
      ),
      new Items.fromDetails(
        itemName: "Coca Cola",
        worth: "1",
        photo: Image.asset("assets/item/Coca Cola.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
          itemName: "Monthly Mobile recharge ",
          worth: "3",
          photo: Image.asset("assets/item/Monthly Mobile recharge.png"),
          addCallBack: addValue,
          subCallBack: subValue),
      new Items.fromDetails(
        itemName: "Movie Tickets",
        worth: "12",
        photo: Image.asset("assets/item/Movie Tickets.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
          itemName: "Book",
          worth: "15",
          photo: Image.asset("assets/item/Book.png"),
          addCallBack: addValue,
          subCallBack: subValue),
      new Items.fromDetails(
        itemName: "Lobster Dinner",
        worth: "45",
        photo: Image.asset("assets/item/Lobster Dinner.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Video game",
        worth: "60",
        photo: Image.asset("assets/item/Video game.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Amazon Echo",
        worth: "90",
        photo: Image.asset("assets/item/Amazon Echo.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Year of Netflix",
        worth: "100",
        photo: Image.asset("assets/item/Year of Netflix.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Air Jordans",
        worth: "125",
        photo: Image.asset("assets/item/Air Jordans.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Airpods",
        worth: "199",
        photo: Image.asset("assets/item/Airpods.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Gaming Console",
        worth: "499",
        photo: Image.asset("assets/item/Gaming Console.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Drone",
        worth: "550",
        photo: Image.asset("assets/item/Drone.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "I Phone",
        worth: "699",
        photo: Image.asset("assets/item/I Phone.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Kitten ",
        worth: "800",
        photo: Image.asset("assets/item/Kitten.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Puppy ",
        worth: "900",
        photo: Image.asset("assets/item/Puppy.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Bike",
        worth: "1500",
        photo: Image.asset("assets/item/Bike.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Auto Rickshaw",
        worth: "2300",
        photo: Image.asset("assets/item/Auto Rickshaw.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Horse",
        worth: "2500",
        photo: Image.asset("assets/item/Horse.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Acre of Farmland",
        worth: "3000",
        photo: Image.asset("assets/item/Acre of Farmland.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Luxary Wine",
        worth: "7000",
        photo: Image.asset("assets/item/Luxary Wine.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Diamond Ring",
        worth: "10000",
        photo: Image.asset("assets/item/Diamond Ring.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Jet ski",
        worth: "12000",
        photo: Image.asset("assets/item/Jet ski.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Rolex",
        worth: "15000",
        photo: Image.asset("assets/item/Rolex.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Ford F-150",
        worth: "30000",
        photo: Image.asset("assets/item/Ford F-150.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Tesla",
        worth: "75000",
        photo: Image.asset("assets/item/Tesla.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Monster Truck",
        worth: "150000",
        photo: Image.asset("assets/item/Monster Truck.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "ferrari",
        worth: "250000",
        photo: Image.asset("assets/item/ferrari.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Single Family Home",
        worth: "300000",
        photo: Image.asset("assets/item/Single Family Home.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Gold Bar",
        worth: "700000",
        photo: Image.asset("assets/item/Gold Bar.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "McDonalds Franchise",
        worth: "1500000",
        photo: Image.asset("assets/item/McDonalds Franchise.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "SuperBowl Ad",
        worth: "5252000",
        photo: Image.asset("assets/item/SuperBowl Ad.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Yacht",
        worth: "7500000",
        photo: Image.asset("assets/item/Yacht.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "M1 Abrams",
        worth: "8000000",
        photo: Image.asset("assets/item/M1 Abrams.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Rafale",
        worth: "91000000",
        photo: Image.asset("assets/item/rafale.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Formula 1 Car",
        worth: "15000000",
        photo: Image.asset("assets/item/Formula 1 Car.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Mansion",
        worth: "45000000",
        photo: Image.asset("assets/item/Mansion.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Make a Movie",
        worth: "100000000",
        photo: Image.asset("assets/item/Make a Movie.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Ipl team",
        worth: "150000000",
        photo: Image.asset("assets/item/Ipl team.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "8",
      ),
      new Items.fromDetails(
        itemName: "Boeing 747",
        worth: "158000000",
        photo: Image.asset("assets/item/Boeing 747.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Mona Lisa",
        worth: "780000000",
        photo: Image.asset("assets/item/Mona Lisa.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "1",
      ),
      new Items.fromDetails(
        itemName: "Skyscraper",
        worth: "850000000",
        photo: Image.asset("assets/item/Skyscraper.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Cruise Ship",
        worth: "930000000",
        photo: Image.asset("assets/item/Cruise Ship.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
      new Items.fromDetails(
        itemName: "Premier leauge team",
        worth: "9500000000",
        photo: Image.asset("assets/item/Premier leauge team.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "20",
      ),
      new Items.fromDetails(
        itemName: "Antilia",
        worth: "1000000000",
        photo: Image.asset("assets/item/Antilia.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "1",
      ),
      new Items.fromDetails(
        itemName: "Kohinoor diamond",
        worth: "120000000",
        photo: Image.asset("assets/item/Kohinoor diamond.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "1",
      ),
      new Items.fromDetails(
        itemName: "Burj Khalifa",
        worth: "150000000000",
        photo: Image.asset("assets/item/Burj Khalifa.png"),
        addCallBack: addValue,
        subCallBack: subValue,
        limit: "1",
      ),
      new Items.fromDetails(
        itemName: "NBA Team",
        worth: "21200000000",
        photo: Image.asset("assets/item/NBA Team.png"),
        addCallBack: addValue,
        subCallBack: subValue,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    populateList();
    netWorthLeft = int.parse(widget.characterToShow.net_worth);
    valueMapper = new Map<String, int>();
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

    if (netWorthLeft == 0) showBrokeAlert();
  }

  void showBrokeAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert!"),
          content: Text(
              "You have spent all of ${widget.characterToShow.name}'s money!"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void addItemQty(String itemName) {
    if (valueMapper.containsKey(itemName)) {
      valueMapper[itemName] += 1;
    } else {
      valueMapper[itemName] = 1;
    }
  }

  void subItemQty(String itemName) {
    if (valueMapper.containsKey(itemName)) {
      valueMapper[itemName] -= 1;
    }
  }

  void createSummary() {
    valueMapper.entries.forEach((element) {
      summaryWidgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(element.key),
            Text("x " + element.value.toString()),
          ],
        ),
      ));
    });
    summaryWidgets.add(Divider(
      height: 1,
      color: Colors.black,
    ));
    summaryWidgets.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Subtotal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "\$${int.parse(widget.characterToShow.net_worth) - netWorthLeft}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
    summaryWidgets.add(Spacer());
    summaryWidgets.add(RaisedButton(
      onPressed: () {
        Navigator.of(context).pop();
        summaryWidgets.clear();
      },
      child: Text(
        "Okay",
        style: TextStyle(color: Colors.white),
      ),
      color: const Color(0xFF1BC0C5),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(widget.characterToShow.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      Text(
                        "\$" + netWorthLeft.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  background: widget.characterToShow.photo),
            ),
          ];
        },
        body: Container(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3.0,
                          child: CheckoutDialog(
                            canBuyMore: int.parse(itemList[index].worth) <=
                                netWorthLeft,
                            addQty: addItemQty,
                            subQty: subItemQty,
                            addCallback: addValue,
                            subtractCallback: subValue,
                            itemName: itemList[index].itemName,
                            itemCost: itemList[index].worth,
                            itemImage: itemList[index].photo,
                            limit: itemList[index].limit,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      color: Colors.grey[300],
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Total Bill: \$${int.parse(widget.characterToShow.net_worth) - netWorthLeft}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          RaisedButton(
                            onPressed: () {
                              createSummary();
                              showGeneralDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  barrierLabel:
                                      MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                  barrierColor: Colors.black45,
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  pageBuilder: (BuildContext buildContext,
                                      Animation animation,
                                      Animation secondaryAnimation) {
                                    return Scaffold(
                                      body: Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              80,
                                          padding: EdgeInsets.all(20),
                                          color: Colors.white,
                                          child: Column(
                                            children: summaryWidgets,
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: const EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xffcc2b5e),
                                    Color(0xff753a88)
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80.0)),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 50,
                                    minWidth: 88.0,
                                    minHeight:
                                        36.0), // min sizes for Material buttons
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: const Text(
                                    'View Summary',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    ));
  }
}
