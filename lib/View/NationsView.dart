import 'package:m2mob/View/Card/NationCard.dart';
import 'package:m2mob/View/ShopCardView.dart';
import 'package:m2mob/WebService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Nation.dart';
import '../Tank.dart';
import 'TankListView.dart';
import '../main.dart';
import 'package:m2mob/GlobalVariables.dart' as globVar ;

class NationsView extends State<MyHomePage> {
  Future<List<Nation>> nations;
  List<Tank> selectedTanks =new List();

  Future<void> _getNations() async {
    nations = WebService.fetchNations();
  }

  @override
  void initState() {
    super.initState();
    _getNations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black, size: 24.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopCardView.id(tanks: selectedTanks)),
              );
            },
          ),
        ]
      ),
      body: Center(
          child: FutureBuilder<List<Nation>>(
              future: nations,
              // ignore: missing_return
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      children: snapshot.data.map((Nation nation){
                        return NationCardView.id(nation: nation);
                      }).toList());
                } else
                  return CircularProgressIndicator();
              })),
    );
  }
}
