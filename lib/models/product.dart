class ProductModel {
  String? image;
  String? title;
  int? rating;
  double? price;
  bool? onSale;
  String? description;

  ProductModel({
    this.image,
    this.title,
    this.rating,
    this.price,
    this.onSale,
    this.description,
  });

  // Factory constructor to create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] as String?,
      title: json['title'] as String?,
      rating: json['rating'] as int?,
      price: json['price'] as double?,
      onSale: json['on_sale'] as bool?,
      description: json['description'] as String?,
    );
  }

  // Method to convert a ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'rating': rating,
      'price': price,
      'on_sale': onSale,
      'description': description,
    };
  }
}