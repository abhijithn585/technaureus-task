class ProductModel {
  String? name;
  String? image;
  int? price;
  ProductModel({required this.name, required this.image, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json['name'], image: json['image'], price: json['price']);
  }
}
