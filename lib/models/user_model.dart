class UserModel {

  String username;
  String email;
  String firstName;
  String lastName;

  UserModel({
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  // Convert object to Firestore Map
  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
    };
  }

  // Create object from Firestore data
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
    );
  }
}