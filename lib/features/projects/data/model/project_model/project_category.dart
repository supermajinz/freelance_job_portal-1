import 'package:equatable/equatable.dart';

class ProjectCategory extends Equatable {
  final int? id;
  final String? name;
  final dynamic photo;

  const ProjectCategory({this.id, this.name, this.photo});

  factory ProjectCategory.fromJson(Map<String, dynamic> json) {
    return ProjectCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      photo: json['photo'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photo': photo,
      };

  @override
  List<Object?> get props => [id, name, photo];
}
