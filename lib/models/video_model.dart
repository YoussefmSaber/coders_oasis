class Video{
  late String id;
  late String createdAt;
  late String courseId;
  late String thumbnailPath;
  late String videoUrl;
  late String videoName;
  late String creator;

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    courseId = json['courseId'];
    thumbnailPath = json['thumbnailPath'];
    videoUrl = json['videoUrl'];
    videoName = json['videoName'];
    creator = json['creator'];
  }
}