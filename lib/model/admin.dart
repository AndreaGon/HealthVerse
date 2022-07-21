class Admin {
  final String id;
  final String notif_content;
  final String timestamp;
  final String title;
  const Admin({
    required this.id,
    required this.notif_content,
    required this.timestamp,
    required this.title,
  });

  factory Admin.fromJson(Map<String, dynamic> parsedJson){
    return Admin(
      id: parsedJson['id'].toString(),
      notif_content : parsedJson['notif_content'].toString(),
      timestamp: parsedJson['timestamp'].toString(),
      title: parsedJson['title'].toString()
    );
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'notif_content': this.notif_content,
    'timestamp': this.timestamp,
    'title': this.title
  };
}
