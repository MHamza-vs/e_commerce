class CategoryModel {
  String? name;
  bool? isPublished;

  CategoryModel({this.name, this.isPublished});

  // Factory constructor to create a CategoryModel from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] as String?,
      isPublished: json['is_published'] as bool?,
    );
  }

  // Method to convert a CategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'is_published': isPublished,
    };
  }
}