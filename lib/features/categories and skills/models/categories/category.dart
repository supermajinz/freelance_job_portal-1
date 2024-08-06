class Category {
  int? id;
  String? name;
  dynamic photoPath;

  Category({this.id, this.name, this.photoPath});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        photoPath: json['photoPath'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoPath': photoPath,
      };
}
