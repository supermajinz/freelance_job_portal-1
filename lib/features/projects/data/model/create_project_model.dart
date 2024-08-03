import 'package:equatable/equatable.dart';

class CreateProjectModel extends Equatable {
  final String? name;
  final String? description;
  final int? minBudget;
  final int? maxBudget;
  final int? expectedDuration;
  final int? clientProfileId;
  final List<int>? projectSkillIds;
  final List<int>? projectCategoriesIds;

  const CreateProjectModel({
    this.name,
    this.description,
    this.minBudget,
    this.maxBudget,
    this.expectedDuration,
    this.clientProfileId,
    this.projectSkillIds,
    this.projectCategoriesIds,
  });

  factory CreateProjectModel.fromJson(Map<String, dynamic> json) =>
      CreateProjectModel(
        name: json['name'] as String?,
        description: json['description'] as String?,
        minBudget: json['minBudget'] as int?,
        maxBudget: json['maxBudget'] as int?,
        expectedDuration: json['ExpectedDuration'] as int?,
        clientProfileId: json['clientProfileId'] as int?,
        projectSkillIds: json['projectSkillIds'] as List<int>?,
        projectCategoriesIds: json['projectCategoriesIds'] as List<int>?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'minBudget': minBudget,
        'maxBudget': maxBudget,
        'ExpectedDuration': expectedDuration,
        'clientProfileId': clientProfileId,
        'projectSkillIds': projectSkillIds,
        'projectCategoriesIds': projectCategoriesIds,
      };

  @override
  List<Object?> get props {
    return [
      name,
      description,
      minBudget,
      maxBudget,
      expectedDuration,
      clientProfileId,
      projectSkillIds,
      projectCategoriesIds,
    ];
  }
}
