import 'dart:convert' show ascii, base64, json, jsonDecode, jsonEncode;

class Vendor {
  String id;
  String firstName;
  String lastName;
  String email;
  String userType = "VENDOR";

  Vendor(this.id, this.firstName, this.lastName, this.email);

  Vendor.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        email = json["email"];

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
