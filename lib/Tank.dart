class Tank {

  int id ;
  bool isPremium;
  String tag ;
  String smallImage ;
  String bigImage ;
  String type ;
  String description;
  String name ;
  int tier ;
  int priceGold ;
  int priceCredit ;

  Tank({this.id, this.isPremium, this.tag, this.smallImage, this.bigImage,
      this.type, this.description, this.name, this.tier, this.priceGold,
      this.priceCredit});

  static List fromJson(Map<String, dynamic> json){
    List<Tank> list = new List();
    json.forEach((key, value) {
        list.add(Tank(
          id: value['tank_id'],
          isPremium: value['is_premium'],
          tag: value['tag'],
          smallImage: value['images']['small_icon'],
          bigImage: value['images']['big_icon'],
          type: value['type'],
          description: value['description'],
          name: value['short_name'],
          tier: value['tier'],
          priceGold: value['price_gold'],
          priceCredit: value['price_credit'],
        ));
    });
    list.sort((a,b) => a.tier.compareTo(b.tier));
    return list ;
  }

  String returnTypeTranslated(){
    switch(this.type){
      case "lightTank" : return "Char léger" ;
      case "mediumTank" : return "Char moyen" ;
      case "heavyTank" : return "Char lourd" ;
      case "AT-SPG" : return "Chasseur de chars" ;
      case "SPG" : return "Artillerie" ;
      default : return "pas défini" ;
    }
  }

  @override
  String toString() {
    return 'Tank{id: $id, isPremium: $isPremium, tag: $tag, smallImage: $smallImage, bigImage: $bigImage, type: $type, description: $description, name: $name, tier: $tier, priceGold: $priceGold, priceCredit: $priceCredit}';
  }


}