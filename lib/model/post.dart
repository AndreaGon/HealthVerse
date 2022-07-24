class Post {
  final String id;
  final String comments_number;
  final int likes_number;
  final String text;
  final String userId;
  final String username;
  const Post({
    required this.id,
    required this.comments_number,
    required this.likes_number,
    required this.text,
    required this.userId,
    required this.username,
  });

  factory Post.fromJson(Map<String, dynamic> parsedJson){
    return Post(
      id: parsedJson['id'].toString(),
      comments_number: parsedJson['comments_number'].toString(),
      likes_number : parsedJson['likes_number'],
      text: parsedJson['text'].toString(),
      userId: parsedJson['userId'].toString(),
      username: parsedJson['username'].toString()
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'comments_number': comments_number,
    'likes_number': likes_number,
    'text': text,
    'userId': userId,
    'username': username
  };
}
