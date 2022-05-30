import 'dart:convert' show ascii, base64, json, jsonDecode, jsonEncode;

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String userType;

  User(this.id, this.firstName, this.lastName, this.email, this.userType);

  User.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        email = json["email"],
        userType = json["userType"];

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userType': userType
    };
  }
}
