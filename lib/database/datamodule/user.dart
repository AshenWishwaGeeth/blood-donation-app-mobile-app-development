class User {
  final int? id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String contactNo;
  final String gender;
  final String password;
  final String location;

  User({
    this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.contactNo,
    required this.gender,
    required this.password,
    required this.location,
  });

  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'contactNo': contactNo,
      'gender': gender,
      'password': password,
      'location': location,
    };
  }
}
