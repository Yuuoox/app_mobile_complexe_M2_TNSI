import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Tank.dart';

import 'package:m2mob/GlobalVariables.dart' as globVars;

class TankDetailsView extends StatefulWidget {
  final Tank tank;
  final bool onlyView;

  const TankDetailsView.id(
      {Key key, @required this.tank, @required this.onlyView})
      : super(key: key);

  @override
  TankDetailsState createState() => TankDetailsState(tank, onlyView);
}

class TankDetailsState extends State<TankDetailsView> {
  Tank tank;
  bool onlyView;

  TankDetailsState(Tank _tank, bool _onlyView) {
    this.tank = _tank;
    this.onlyView = _onlyView;
  }

  bool isAlreadyIn(Tank _tank) {
    bool ret = false;
    if (globVars.savedTanks.isNotEmpty) {
      // ignore: missing_return
      globVars.savedTanks.forEach((t) {
        if (t.id == _tank.id)
          // ignore: missing_return
          ret = true;
      });
    }
    return ret;
  }

  @override
  void initState() {
    super.initState();
    print(tank);
  }

  void alreadyAddedAlertBox(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Déjà dans le panier"),
      content: Text("Ce char est déjà présent dans votre panier."),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  RaisedButton showAddToPurchase(BuildContext context) {
    if (this.onlyView) {
      print("dans only view");
      return RaisedButton(
        // ignore: missing_return
          onPressed: () {
            globVars.savedTanks.remove(tank);
            Navigator.pop(context);
          },
          child: Text("supprimer du panier", style: TextStyle(fontSize: 20)));
    } else
      return RaisedButton(
          // ignore: missing_return
          onPressed: () {
            if (!isAlreadyIn(tank)) {
              globVars.savedTanks.add(tank);
              Navigator.of(context).popUntil((route) => route.isFirst);
            } else {
              alreadyAddedAlertBox(context);
            }
          },
          child: Text("Ajouter au panier", style: TextStyle(fontSize: 20)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails du " + tank.name),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(tank.name,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: Image.network(tank.bigImage)),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(tank.description,
              style: TextStyle(fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
        ),
        Text("Tiers : " + tank.tier.toString()),
        Text("Prix : " +
            ((!tank.isPremium)
                ? tank.priceCredit.toString() + " crédits"
                : (tank.priceGold == null)
                    ? "Pas en vente"
                    : tank.priceGold.toString() + " or")),
        Visibility(
            visible: !this.onlyView,
            child: RaisedButton(

                // ignore: missing_return
                onPressed: () {
                  if (!isAlreadyIn(tank)) {
                    globVars.savedTanks.add(tank);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  } else {
                    alreadyAddedAlertBox(context);
                  }
                },
                child:
                    Text("Ajouter au panier", style: TextStyle(fontSize: 20)))),
        Visibility(
            visible: this.onlyView,
            child: RaisedButton(

              // ignore: missing_return
                onPressed: () {
                  globVars.savedTanks.remove(tank);
                  Navigator.pop(context);
                },
                child:
                Text("Supprimer du panier", style: TextStyle(fontSize: 20))))
      ]),
    );
  }
}
