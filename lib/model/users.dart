class Users {
  final String id; 
  final String imagePath;
  final String name;
  final String gender;
  final String height;
  final String weight;
  final String email;
  final String points;
  final String calories;
  final String hours;
  final String steps;
  final String date;
  final String last_exercise;

  const Users({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.email,
    required this.points,
    required this.calories,
    required this.hours,
    required this.steps,
    required this.date,
    required this.last_exercise,
  });

  factory Users.fromJson(Map<String, dynamic> parsedJson){
    return Users(
      id: parsedJson['id'].toString(),
      imagePath: parsedJson['imagePath'].toString(),
      name: parsedJson['name'].toString(),
      gender: parsedJson['gender'].toString(),
      height: parsedJson['height'].toString(),
      weight: parsedJson['weight'].toString(),
      email : parsedJson['email'].toString(),
      points: parsedJson['points'].toString(),
      calories: parsedJson['calories'].toString(),
      hours: parsedJson['hours'].toString(),
      steps: parsedJson['steps'].toString(),
      date: parsedJson['date'].toString(),
      last_exercise: parsedJson['last_exercise'].toString()
    );
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'imagePath': this.imagePath,
    'name': this.name,
    'gender': this.gender,
    'height': this.height,
    'weight': this.weight,
    'email': this.email,
    'points': this.points,
    'calories': this.calories,
    'hours': this.hours,
    'steps': this.steps,
    'date': this.date,
    'last_exercise': this.last_exercise
  };
}
