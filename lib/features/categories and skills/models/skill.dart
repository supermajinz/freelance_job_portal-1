import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final int? id;
  final String? name;
  final int? categoryId;
  final String? categoryName;

  const Skill({this.id, this.name, this.categoryId, this.categoryName});

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json['id'] as int?,
        name: json['name'] as String?,
        categoryId: json['categoryId'] as int?,
        categoryName: json['categoryName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'categoryId': categoryId,
        'categoryName': categoryName,
      };

  @override
  List<Object?> get props => [id, name, categoryId, categoryName];
}
