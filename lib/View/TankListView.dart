import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Nation.dart';
import '../Tank.dart';
import '../WebService.dart';
import '../main.dart';
import 'TankView.dart';

class TankListView extends StatefulWidget {

  final Nation nation ;

  const TankListView.nation({Key key, @required this.nation}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TankListState(nation);
  }


}

class TankListState extends State<TankListView>{

  Nation nation ;
  Future<List<Tank>> tanks ;
  bool showOnlyPremium = false;
  int tier = 0 ;
  String type = "" ;
  TankListState(Nation _nation){
    this.nation = _nation;
  }

  Future<List<Tank>> _getTanks() async {
    tanks = WebService.fetchTanksByCriteria(nation.ref, type, tier);
    return tanks ;
  }

  Future<void> tierSelectChanged(String _tier) async {
    if(_tier == "") tier = 0;
    tier = int.parse(_tier);
    setState((){ this.tanks = WebService.fetchTanksByCriteria(nation.ref, type, tier); });
  }

  void showPremiumTankOnly(){
    List<Tank> list = new List();
  }


  @override
  void initState() {
    super.initState();
    _getTanks();
  }

  Widget getTanksListWidget(BuildContext context){
    return new FutureBuilder<List<Tank>>(
        future: _getTanks(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                // ignore: missing_return
                children:snapshot.data.map((Tank tank){
                   return TankView.id(tank: tank, onlyView: false);
                }).toList());
          } else
            return CircularProgressIndicator();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listes des chars " + nation.name),
      ),
      body: Column(

          children: <Widget>[
            Row(
              children : <Widget>[
                Text("type de chars"),
                Row(
                    children: <Widget>[new DropdownButton<String>(
                    items: <String>["Léger", "Moyen", "Lourd", "Chasseur de chars","Artillerie"].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      switch(value) {
                        case "Léger" : type = "lightTank" ; break ;
                        case "Moyen" : type = "mediumTank"; break ;
                        case "Lourd" : type = "heavyTank" ; break ;
                        case "Chasseur de chars" : type = "AT-SPG" ; break ;
                        case "artillerie": type = "SPG" ; break ;
                        default : type = "" ; break ;
                      }
                      super.setState((){});
                    },
                  )
              ]
            )]),
            Row(
              children : <Widget>[
                Text("Tiers"),
                new DropdownButton<String>(
                items: <String>["", "1", "2", "3", "4","5","6", "7", "8", "9","10"].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String _tier) {
                  if(_tier != "")
                    tier = int.parse(_tier);
                  else
                    tier = 0;
                  super.setState((){});
                }),
              ]),
    Expanded(
            child: getTanksListWidget(context))]
      ),
    );
  }
}