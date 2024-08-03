import 'package:equatable/equatable.dart';

class EditProjectModel extends Equatable {
  final String? name;
  final String? description;
  final int? minBudget;
  final int? maxBudget;
  final int? expectedDuration;
  final String? status;
  final List<int>? projectSkillIds;
  final List<int>? projectCategoriesIds;

  const EditProjectModel({
    this.name,
    this.description,
    this.minBudget,
    this.maxBudget,
    this.expectedDuration,
    this.status,
    this.projectSkillIds,
    this.projectCategoriesIds,
  });

  factory EditProjectModel.fromJson(Map<String, dynamic> json) {
    return EditProjectModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      minBudget: json['minBudget'] as int?,
      maxBudget: json['maxBudget'] as int?,
      expectedDuration: json['ExpectedDuration'] as int?,
      status: json['status'] as String?,
      projectSkillIds: json['projectSkillIds'] as List<int>?,
      projectCategoriesIds: json['projectCategoriesIds'] as List<int>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'minBudget': minBudget,
        'maxBudget': maxBudget,
        'ExpectedDuration': expectedDuration,
        'status': status,
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
      status,
      projectSkillIds,
      projectCategoriesIds,
    ];
  }
}
