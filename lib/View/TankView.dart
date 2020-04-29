import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Tank.dart';
import 'TankDetailsView.dart';

class TankView extends StatefulWidget{
  final bool onlyView;
  final Tank tank ;
  const TankView.id({Key key, @required this.tank, @required this.onlyView}) : super(key: key);

  @override
  TankViewState createState() => TankViewState(tank, onlyView);
}

class TankViewState extends State<TankView>{

  Tank tank ;
  bool onlyView ;

  TankViewState(Tank _tank, bool _onlyView){
    this.tank = _tank ;
    this.onlyView = _onlyView ;
  }

  @override
  void initState() {
    super.initState();
  //  print(tank);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TankDetailsView.id(tank: tank, onlyView: onlyView)),
          );
        },
        child: Card(
            child : Column(
              children: <Widget>[
                Text(tank.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color : ((tank.isPremium) ? Colors.yellowAccent : Colors.black))),
                Text(tank.tier.toString()),
                Text(tank.returnTypeTranslated()),
                Flexible(
                    child : Image.network(tank.bigImage)
                )
              ],
            )
        )
    );
  }

}