class Nation {

  String ref ;
  String name ;

  Nation({this.ref, this.name});

  static List fromJson(Map<String, dynamic> json){
    List<Nation> list = new List();
    json.forEach((key,value){
      list.add(Nation(ref: key, name: value));
    });
    return list ;
  }

  @override
  String toString() {
    return 'Nation{ref: $ref, name: $name}';
  }


}