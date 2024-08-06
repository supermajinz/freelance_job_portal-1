class JobTitle {
  int? id;
  String? title;

  JobTitle({this.id, this.title});

  factory JobTitle.fromJson(Map<String, dynamic> json) => JobTitle(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
