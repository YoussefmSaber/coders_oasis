class Course {
  late String id;
  late String created_at;
  late String thumbnail_path;
  late String name;
  late String brief_desc;
  late String description;
  late String duration;
  late String creator;

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created_at = json['created_at'];
    thumbnail_path = json['thumbnail_path'];
    name = json['name'];
    brief_desc = json['brief'];
    description = json['description'];
    duration = json['duration'];
    creator = json['creator'];
  }
}
