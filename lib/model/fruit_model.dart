class FruitModel {
  String? name;
  String? type;
  String? desc;
  String? id;
  FruitModel(
      {required this.name,
      required this.type,
      required this.desc,
      required this.id});
  FruitModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        type = json['type'],
        id = json['id'],
        desc = json['desc'];
  Map<String, dynamic> toJson() {
    Map<String, dynamic> mapFruit = Map.from(
        <String, dynamic>{'name': name, 'type': type, 'desc': desc, 'id': id});
    return mapFruit;
  }
}
