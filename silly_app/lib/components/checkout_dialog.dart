import 'package:flutter/material.dart';

class CheckoutDialog extends StatefulWidget {
  final String itemName;
  final String itemCost;
  final String limit;
  final Image itemImage;
  final Function(int value) addCallback;
  final Function(int value) subtractCallback;
  final Function(String itemName) addQty;
  final Function(String itemName) subQty;
  final bool canBuyMore;

  CheckoutDialog({
    this.itemCost,
    this.itemImage,
    this.itemName,
    this.limit,
    this.addCallback,
    this.subtractCallback,
    this.addQty,
    this.subQty,
    this.canBuyMore,
  });

  @override
  _CheckoutDialogState createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  int limit = 0;
  @override
  void initState() {
    super.initState();
    if (widget.limit != null)
      limit = int.parse(widget.limit);
    else
      limit = 9223372036854775807; // max value for a 64 bit number
  }

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
                  color: currentCount > 0 ? Colors.red : Colors.grey,
                  child: Text(
                    "Sell",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: currentCount > 0
                      ? () {
                          widget.subQty(widget.itemName);
                          widget.addCallback(int.parse(widget.itemCost));
                          setState(() {
                            currentCount--;
                          });
                        }
                      : () {}),
              Container(
                child: Text(currentCount.toString()),
              ),
              RaisedButton(
                  color: (currentCount < limit && widget.canBuyMore)
                      ? Colors.green
                      : Colors.grey,
                  child: Text(
                    "Buy",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: (currentCount < limit && widget.canBuyMore)
                      ? () {
                          widget.addQty(widget.itemName);
                          widget.subtractCallback(int.parse(widget.itemCost));
                          setState(() {
                            currentCount++;
                          });
                        }
                      : () {}),
            ],
          )
        ],
      ),
    );
  }
}
