import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String? description;
  final int? overall;
  final double? proficiency;
  final double? communication;
  final double? quality;
  final String? rated;
  final int? clientProfileId;
  final int? workerProfileId;

  const ReviewModel({
    this.description,
    this.overall,
    this.proficiency,
    this.communication,
    this.quality,
    this.rated,
    this.clientProfileId,
    this.workerProfileId,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        description: json['description'] as String?,
        overall: json['overall'] as int?,
        proficiency: (json['proficiency'] as num?)?.toDouble(),
        communication: (json['communication'] as num?)?.toDouble(),
        quality: (json['quality'] as num?)?.toDouble(),
        rated: json['rated'] as String?,
        clientProfileId: json['clientProfileId'] as int?,
        workerProfileId: json['workerProfileId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'overall': overall,
        'proficiency': proficiency,
        'communication': communication,
        'quality': quality,
        'rated': rated,
        'clientProfileId': clientProfileId,
        'workerProfileId': workerProfileId,
      };

  @override
  List<Object?> get props {
    return [
      description,
      overall,
      proficiency,
      communication,
      quality,
      rated,
      clientProfileId,
      workerProfileId,
    ];
  }
}
