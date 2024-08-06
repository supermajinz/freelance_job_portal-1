import 'package:equatable/equatable.dart';

class Skills extends Equatable {
  final int id;
  final String name;

  const Skills({required this.id, required this.name});

  factory Skills.fromJson(Map<String, dynamic> json) => Skills(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
// class Skills {
//     Skills({
//         required this.clientProfiles,
//     });

//     final ClientProfiles? clientProfiles;

//     factory Skills.fromJson(Map<String, dynamic> json){
//         return Skills(
//             clientProfiles: json["clientProfiles"] == null ? null : ClientProfiles.fromJson(json["clientProfiles"]),
//         );
//     }

//     Map<String, dynamic> toJson() => {
//         "clientProfiles": clientProfiles?.toJson(),
//     };

// }

// class ClientProfiles {
//     ClientProfiles({
//         required this.headers,
//         required this.body,
//         required this.statusCode,
//         required this.statusCodeValue,
//     });

//     final Headers? headers;
//     final List<Body> body;
//     final String? statusCode;
//     final int? statusCodeValue;

//     factory ClientProfiles.fromJson(Map<String, dynamic> json){
//         return ClientProfiles(
//             headers: json["headers"] == null ? null : Headers.fromJson(json["headers"]),
//             body: json["body"] == null ? [] : List<Body>.from(json["body"]!.map((x) => Body.fromJson(x))),
//             statusCode: json["statusCode"],
//             statusCodeValue: json["statusCodeValue"],
//         );
//     }

//     Map<String, dynamic> toJson() => {
//         "headers": headers?.toJson(),
//         "body": body.map((x) => x?.toJson()).toList(),
//         "statusCode": statusCode,
//         "statusCodeValue": statusCodeValue,
//     };

// }

// class Body {
//     Body({
//         required this.id,
//         required this.name,
//         required this.categoryId,
//         required this.categoryName,
//     });

//     final int? id;
//     final String? name;
//     final int? categoryId;
//     final String? categoryName;

//     factory Body.fromJson(Map<String, dynamic> json){
//         return Body(
//             id: json["id"],
//             name: json["name"],
//             categoryId: json["categoryId"],
//             categoryName: json["categoryName"],
//         );
//     }

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "categoryId": categoryId,
//         "categoryName": categoryName,
//     };

// }

// class Headers {
//     Headers({required this.json});
//     final Map<String,dynamic> json;

//     factory Headers.fromJson(Map<String, dynamic> json){
//         return Headers(
//         json: json
//         );
//     }

//     Map<String, dynamic> toJson() => {
//     };

// }
