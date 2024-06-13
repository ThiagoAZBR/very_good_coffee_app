class CoffeeModel {
  String file;

  CoffeeModel({
    required this.file,
  });

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    return CoffeeModel(
      file: map['file'] ?? '',
    );
  }
}
