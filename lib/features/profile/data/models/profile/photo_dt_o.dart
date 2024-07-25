import 'dart:convert';

import 'package:equatable/equatable.dart';

class PhotoDtO extends Equatable {
  final int? id;
  final String? photo;

  const PhotoDtO({this.id, this.photo});

  factory PhotoDtO.fromMap(Map<String, dynamic> data) => PhotoDtO(
        id: data['id'] as int?,
        photo: data['photo'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'photo': photo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PhotoDtO].
  factory PhotoDtO.fromJson(String data) {
    return PhotoDtO.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PhotoDtO] to a JSON string.
  String toJson() => json.encode(toMap());

  PhotoDtO copyWith({
    int? id,
    String? photo,
  }) {
    return PhotoDtO(
      id: id ?? this.id,
      photo: photo ?? this.photo,
    );
  }

  @override
  List<Object?> get props => [id, photo];
}
