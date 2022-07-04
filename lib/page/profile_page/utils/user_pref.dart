import 'package:flutter_userprofile1/model/users.dart';

class UserPreferences {
  static const myUser = Users(
    //temporary *later integrate w firebase*
    imagePath:
        "https://www.looper.com/img/gallery/things-only-adults-notice-in-shrek/intro-1573597941.jpg",
    name: "William",
    email: 'example@gmail.com',
    points: '500',
    calories: '300',
    hours: '1.5',
    steps: '800',
    date: "13th May 2022",
    last_exercise: "Swimming", id: '0', gender: '', height: '', weight: '',
  );
}
