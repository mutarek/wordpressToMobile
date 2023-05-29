class CategoryModel {
  int? id;
  int? count;
  String? name;

  CategoryModel({required this.id, required this.count, required this.name});

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    count = json['count'];
    name = json['name'];
  }
}
