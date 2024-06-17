class CoffeeModel {
  String file;
  bool isFavoriteCoffee;

  CoffeeModel({
    required this.file,
    this.isFavoriteCoffee = false,
  });

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    return CoffeeModel(
      file: map['file'] ?? '',
    );
  }
}
