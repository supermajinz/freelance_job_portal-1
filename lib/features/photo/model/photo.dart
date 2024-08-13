import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final String photo;

  const Photo({required this.id, required this.photo});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json['id'] as int,
        photo: json['photo'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'photo': photo,
      };
  @override
  List<Object?> get props => [id, photo];
}
