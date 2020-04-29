import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Nation.dart';
import '../Tank.dart';
import '../WebService.dart';
import '../main.dart';
import 'ShopConfirmView.dart';
import 'TankView.dart';
import 'package:m2mob/GlobalVariables.dart' as globVars ;

class ShopCardView extends StatefulWidget {

  final List<Tank> tanks ;

  const ShopCardView.id({Key key, @required this.tanks}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ShopCardState(tanks);
  }


}

class ShopCardState extends State<ShopCardView> {

  List<Tank> tanks;

  ShopCardState(List<Tank> _tanks) {
    this.tanks = globVars.savedTanks;
  }

  void getTanks() async {
    this.tanks = globVars.savedTanks;
  }

  @override
  void initState() {
    super.initState();
    getTanks();
  }

  Widget getTanksListWidget(BuildContext context) {
    if(this.tanks.length>0)
      return GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          // ignore: missing_return
          children: tanks.map((Tank tank) {
            return TankView.id(tank: tank, onlyView: true);
        }).toList());
    else
      return Column(
          children: <Widget>[
            Center(
                child: Text("Le panier est vide")
            )
          ]
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mon panier"),
            actions: <Widget>[
              FlatButton(
                child: Text("Valider", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShopConfirmView()),
                  );
                },
              ),
            ]
        ),
        body: Column(
            children: <Widget>[
        Row(
        children : <Widget>[
            Expanded(
            child: getTanksListWidget(context))])]
    )
    );
  }
}