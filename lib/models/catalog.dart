class CatalogModel {
  static List<Item>? items;
}

class Item {
  int id;
  String name;
  String desc;
  num price;
  String color;
  String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        color: json["color"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
