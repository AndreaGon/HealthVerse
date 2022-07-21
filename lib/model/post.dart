class Post {
  final String comments_number;
  final String likes_number;
  final String text;
  final String userId;
  const Post({
    required this.comments_number,
    required this.likes_number,
    required this.text,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> parsedJson){
    return Post(
      comments_number: parsedJson['comments_number'].toString(),
      likes_number : parsedJson['likes_number'].toString(),
      text: parsedJson['text'].toString(),
      userId: parsedJson['userId'].toString()
    );
  }

  Map<String, dynamic> toJson() => {
    'comments_number': this.comments_number,
    'likes_number': this.likes_number,
    'text': this.text,
    'userId': this.userId
  };
}
