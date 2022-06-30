class Users {
  final String id; 
  final String name;
  final String email;
  final String points;
  final String calories;
  final String hours;
  final String steps;
  final String date;
  final String last_exercise;

  const Users({
    required this.id,
    required this.name,
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
      name: parsedJson['name'].toString(),
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
    'name': this.name,
    'email': this.email,
    'points': this.points,
    'calories': this.calories,
    'hours': this.hours,
    'steps': this.steps,
    'date': this.date,
    'last_exercise': this.last_exercise
  };
}
