import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final int id;
  final String name;
  final dynamic photoPath;

  const Categories({required this.id, required this.name, this.photoPath});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json['id'] as int,
        name: json['name'] as String,
        photoPath: json['photoPath'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoPath': photoPath,
      };

  @override
  List<Object?> get props => [id, name, photoPath];
}
