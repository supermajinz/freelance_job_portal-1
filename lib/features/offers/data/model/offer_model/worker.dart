import 'package:equatable/equatable.dart';

class Worker extends Equatable {
  final int? id;
  final dynamic bio;
  final int? userId;
  final int? rate;
  final dynamic jobTitleDto;
  final dynamic categoryDto;
  final dynamic photoDtOs;
  final dynamic skillDtOs;
  final dynamic userDto;

  const Worker({
    this.id,
    this.bio,
    this.userId,
    this.rate,
    this.jobTitleDto,
    this.categoryDto,
    this.photoDtOs,
    this.skillDtOs,
    this.userDto,
  });

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
        id: json['id'] as int?,
        bio: json['bio'] as dynamic,
        userId: json['userId'] as int?,
        rate: json['rate'] as int?,
        jobTitleDto: json['jobTitleDTO'] as dynamic,
        categoryDto: json['categoryDTO'] as dynamic,
        photoDtOs: json['photoDTOs'] as dynamic,
        skillDtOs: json['skillDTOs'] as dynamic,
        userDto: json['userDTO'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'bio': bio,
        'userId': userId,
        'rate': rate,
        'jobTitleDTO': jobTitleDto,
        'categoryDTO': categoryDto,
        'photoDTOs': photoDtOs,
        'skillDTOs': skillDtOs,
        'userDTO': userDto,
      };

  @override
  List<Object?> get props {
    return [
      id,
      bio,
      userId,
      rate,
      jobTitleDto,
      categoryDto,
      photoDtOs,
      skillDtOs,
      userDto,
    ];
  }
}
