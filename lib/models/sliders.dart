class SliderModel {
  String image;
  bool? isPublished;

  SliderModel({required this.image, this.isPublished});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      image: json['image'],
      isPublished: json['is_published'] as bool?,
    );
  }

  // Method to convert a SliderModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'is_published': isPublished,
    };
  }
}