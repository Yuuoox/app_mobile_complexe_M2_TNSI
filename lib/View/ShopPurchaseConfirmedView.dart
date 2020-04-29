import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m2mob/GlobalVariables.dart' as globVars;

class ShopPurchaseConfirmedView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ShopPurchaseConfirmedState();
  }
}

class ShopPurchaseConfirmedState extends State<ShopPurchaseConfirmedView> {
  ShopPurchaseConfirmedState();

  @override
  void initState() {
    super.initState();
    globVars.savedTanks = new List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Confirmation d'achat")),
        body: Center(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("L'achat a été confirmé."),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                "Vous serez informé par mail quand ces chars seront mis à votre disposition.", textAlign: TextAlign.center,),
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text("Revenir à l'accueil",
                    style: TextStyle(fontSize: 20))),
          ),
        ])));
  }
}
