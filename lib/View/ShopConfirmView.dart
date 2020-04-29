import 'package:m2mob/View/ShopPurchaseConfirmedView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Nation.dart';
import '../Tank.dart';
import '../WebService.dart';
import '../main.dart';
import 'TankView.dart';
import 'package:m2mob/GlobalVariables.dart' as globVars;

class ShopConfirmView extends StatefulWidget {
  //const ShopCardState.id({Key key, @required this.tanks}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ShopConfirmState();
  }
}

class ShopConfirmState extends State<ShopConfirmView> {
  ShopConfirmState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Confirmation du panier")),
        body: Center(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  "Êtes-vous sûr de confirmer votre panier comprenant " +
                      globVars.savedTanks.length.toString() +
                      " chars ?",
                textAlign: TextAlign.center),),
          Padding(
              padding: EdgeInsets.all(25.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShopPurchaseConfirmedView()),
                  );
                },
                child:
                    Text("Confirmer l'achat", style: TextStyle(fontSize: 20)),
              )),
        ])));
  }
}
