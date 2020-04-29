import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Tank.dart';
import '../TankView.dart';

class TankCardView extends StatefulWidget{
  final Tank tank ;
  const TankCardView.id({Key key, @required this.tank}) : super(key: key);

  @override
  TankCardState createState() => TankCardState(tank);
}

class TankCardState extends State<TankCardView>{

  Tank tank ;

  TankCardState(Tank _tank){
    this.tank = _tank ;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TankView.id(tank: tank)),
          );
        },
        child: Card(
            child : Column(
              children: <Widget>[
                Text(tank.name),
                Flexible(
                    child :
                    Image.network(tank.bigImage)
                )
              ],
            )
        )
    );
  }

}