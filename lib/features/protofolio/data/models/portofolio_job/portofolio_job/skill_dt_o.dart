import 'package:equatable/equatable.dart';

class SkillDtO extends Equatable {
  final int? id;
  final String? name;

  const SkillDtO({this.id, this.name});

  factory SkillDtO.fromJson(Map<String, dynamic> json) => SkillDtO(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  SkillDtO copyWith({
    int? id,
    String? name,
  }) {
    return SkillDtO(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
