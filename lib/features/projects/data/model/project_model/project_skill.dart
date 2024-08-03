import 'package:equatable/equatable.dart';

class ProjectSkill extends Equatable {
  final int? id;
  final String? name;

  const ProjectSkill({this.id, this.name});

  factory ProjectSkill.fromJson(Map<String, dynamic> json) => ProjectSkill(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
