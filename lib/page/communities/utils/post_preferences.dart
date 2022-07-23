import 'package:flutter_userprofile1/model/post.dart';

class PostPreferences {
  static final posts = [
    const Post(
      //temporary *later integrate w firebase*
      comments_number:'28',
      likes_number: '12',
      text: 'Just had a nice healthy breakfast!',
      userId: '0'
    ),
    const Post(
      //temporary *later integrate w firebase*
      comments_number:'19',
      likes_number: '5',
      text: 'Hiking and Exercising!',
      userId: '5'
    ),
  ];
}
