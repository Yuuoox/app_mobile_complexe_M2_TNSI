
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Nation.dart';
import '../TankListView.dart';


class NationCardView extends StatefulWidget {
  final Nation nation;

  const NationCardView.id({Key key, @required this.nation}) : super(key: key);

  @override
  NationCardState createState() => NationCardState(nation);
}

class NationCardState extends State<NationCardView> {
  Nation nation;

  NationCardState(Nation _nation) {
    this.nation = _nation;
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
            MaterialPageRoute(
                builder: (context) => TankListView.nation(nation: nation)),
          );
        },
        child: Card(
            child: Column(
          children: <Widget>[
            Text(nation.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Flexible(
                child: Center(
                  child: Image.asset("assets/" + nation.ref + ".jpg"),
                )
            )
          ],
        )));
  }
}
