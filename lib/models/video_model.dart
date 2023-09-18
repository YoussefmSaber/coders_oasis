class Video{
  late String id;
  late String createdAt;
  late String courseId;
  late String thumbnailPath;
  late String videoUrl;
  late String videoName;
  late String creator;
  late int videoNum;

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    courseId = json['course_id'];
    thumbnailPath = json['thumb_path'];
    videoUrl = json['url'];
    videoName = json['title'];
    creator = json['creator'];
    videoNum = json['video_num'];
  }
}