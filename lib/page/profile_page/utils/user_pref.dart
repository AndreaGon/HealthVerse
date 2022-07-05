import 'package:flutter_userprofile1/model/user.dart';

class UserPreferences {
  static const myUser = Users(
    id: "1",
    //temporary *later integrate w firebase*
    name: "William",
    email: 'example@gmail.com',
    points: '500',
    calories: '300',
    hours: '1.5',
    steps: '800',
    date: "13th May 2022",
    last_exercise: "Swimming",
  );
}
