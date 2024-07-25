import 'dart:convert';

import 'package:equatable/equatable.dart';

class SkillDtO extends Equatable {
  final int? id;
  final String? name;

  const SkillDtO({this.id, this.name});

  factory SkillDtO.fromMap(Map<String, dynamic> data) => SkillDtO(
        id: data['id'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SkillDtO].
  factory SkillDtO.fromJson(String data) {
    return SkillDtO.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SkillDtO] to a JSON string.
  String toJson() => json.encode(toMap());

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
