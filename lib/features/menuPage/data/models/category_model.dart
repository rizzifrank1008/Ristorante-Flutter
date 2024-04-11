import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel(String name) : super(name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(json['nome']);
  }

  Map<String, dynamic> toJson() {
    return {'nome': name};
  }
}
