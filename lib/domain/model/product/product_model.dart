class ProductModel {
  String? id;
  String? name;
  String? price;
  String? image;
  String? discount;

  ProductModel({this.name, this.price, this.image, this.discount, this.id});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'discount': discount,
      'id': id
    };
  }
}
