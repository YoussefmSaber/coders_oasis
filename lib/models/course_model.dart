class Course {
  late String id;
  late String createdAt;
  late String thumbnailPath;
  late String name;
  late String briefDesc;
  late String description;
  late String duration;
  late String creator;

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    thumbnailPath = json['thumbnail_path'];
    name = json['name'];
    briefDesc = json['brief'];
    description = json['description'];
    duration = json['duration'];
    creator = json['creator'];
  }
}
