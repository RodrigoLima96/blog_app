class BlogEntity {
  final String id;
  final String userId;
  final String username;
  final String title;
  final String content;
  final String imageUrl;
  final List<String> topics;
  final DateTime updatedAt;

  BlogEntity({
    required this.id,
    required this.userId,
    required this.username,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.topics,
    required this.updatedAt,
  });
}
