import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'client_profile.dart';

class Profile extends Equatable {
  final List<ClientProfile>? clientProfiles;

  const Profile({this.clientProfiles});

  factory Profile.fromMap(Map<String, dynamic> data) => Profile(
        clientProfiles: (data['clientProfiles'] as List<dynamic>?)
            ?.map((e) => ClientProfile.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'clientProfiles': clientProfiles?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Profile].
  factory Profile.fromJson(String data) {
    return Profile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Profile] to a JSON string.
  String toJson() => json.encode(toMap());

  Profile copyWith({
    List<ClientProfile>? clientProfiles,
  }) {
    return Profile(
      clientProfiles: clientProfiles ?? this.clientProfiles,
    );
  }

  @override
  List<Object?> get props => [clientProfiles];
}
