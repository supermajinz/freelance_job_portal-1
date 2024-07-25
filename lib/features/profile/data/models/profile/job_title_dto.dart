import 'dart:convert';

import 'package:equatable/equatable.dart';

class JobTitleDto extends Equatable {
  final int? id;
  final String? title;

  const JobTitleDto({this.id, this.title});

  factory JobTitleDto.fromMap(Map<String, dynamic> data) => JobTitleDto(
        id: data['id'] as int?,
        title: data['title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [JobTitleDto].
  factory JobTitleDto.fromJson(String data) {
    return JobTitleDto.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [JobTitleDto] to a JSON string.
  String toJson() => json.encode(toMap());

  JobTitleDto copyWith({
    int? id,
    String? title,
  }) {
    return JobTitleDto(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [id, title];
}
