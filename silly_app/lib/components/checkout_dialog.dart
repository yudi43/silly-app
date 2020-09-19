import 'package:flutter/material.dart';

class CheckoutDialog extends StatefulWidget {
  final String itemName;
  final String itemCost;
  final String limit;
  final Image itemImage;

  CheckoutDialog({
    this.itemCost,
    this.itemImage,
    this.itemName,
    this.limit,
  });

  @override
  _CheckoutDialogState createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  int currentCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            child: widget.itemImage,
          ),
          Text(
            widget.itemName.toString(),
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            "\$" + widget.itemCost.toString(),
            style: TextStyle(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  color: Colors.red,
                  child: Text(
                    "Sell",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      currentCount--;
                    });
                  }),
              Container(
                child: Text(currentCount.toString()),
              ),
              RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "Buy",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      currentCount++;
                    });
                  }),
            ],
          )
        ],
      ),
    );
  }
}
