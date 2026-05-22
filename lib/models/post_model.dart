class PostModel {

  final int id;

  final String mediaType;

  final List<dynamic> imageUrl;

  final String videoUrl;

  final String caption;

  final String userName;

  final String profileImage;

  bool isLiked;

  final int totalLikes;

  PostModel({

    required this.id,

    required this.mediaType,

    required this.imageUrl,

    required this.videoUrl,

    required this.caption,

    required this.userName,

    required this.profileImage,

    required this.isLiked,

    required this.totalLikes,
  });

  factory PostModel.fromJson(
      Map<String, dynamic> json) {

    return PostModel(

      id: json["id"] ?? 0,

      mediaType:
      json["mediaType"] ?? "",

      imageUrl:
      json["imageUrl"] ?? [],

      videoUrl:
      json["videoUrl"] ?? "",

      caption:
      json["captions"] ?? "",

      userName:
      json["fullName"] ?? "",

      profileImage:
      json["profile"] ?? "",

      isLiked:
      json["isLike"] ?? false,

      totalLikes:
      json["totalLikes"] ?? 0,
    );
  }
}