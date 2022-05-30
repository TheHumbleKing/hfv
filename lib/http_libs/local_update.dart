import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
final localStorage = const FlutterSecureStorage();


updateLocalStorage({var userData, String? accessToken}){

  if(accessToken!=null){
    localStorage.write(key: "access_token", value: accessToken);
  }
  localStorage.write(key:"userData", value:jsonEncode(userData));
}


clearLocalStorage() async {
  await localStorage.delete(key: "userData");
  await localStorage.delete(key: "access_token");
}