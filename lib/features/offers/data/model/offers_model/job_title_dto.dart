import 'package:equatable/equatable.dart';

class JobTitleDto extends Equatable {
  final int? id;
  final String? title;

  const JobTitleDto({this.id, this.title});

  factory JobTitleDto.fromJson(Map<String, dynamic> json) => JobTitleDto(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };

  @override
  List<Object?> get props => [id, title];
}
