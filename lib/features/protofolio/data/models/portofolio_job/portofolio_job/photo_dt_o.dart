import 'package:equatable/equatable.dart';

class PhotoDtO extends Equatable {
  final int? id;
  final String? photo;

  const PhotoDtO({this.id, this.photo});

  factory PhotoDtO.fromJson(Map<String, dynamic> json) => PhotoDtO(
        id: json['id'] as int?,
        photo: json['photo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'photo': photo,
      };

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
