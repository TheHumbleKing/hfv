import 'dart:convert';
import 'package:http/http.dart' as http;
import '../defs/customer.dart';
import 'creds.dart';
import 'local_update.dart';

getAccessToken() async {
  var accessToken = await localStorage.read(key: "access_token");

  return accessToken;
}

Future<dynamic> login(String baseUrl, String email, String password,
    Map<String, dynamic> cookies) async {
  var body1 = {"email": email, "password": password};
  print("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
  String bodyF = jsonEncode(body1);
  http.Response result =
      await http.post(Uri.parse(userLoginUrl), body: bodyF, headers: headers);

  print(result.body);
  if (!(result.statusCode == 200)) {
    return null;
  }

  updateCookie(result, cookies, headers);

  return User.fromJson(jsonDecode(result.body));
}

void updateCookie(http.Response response, Map<String, dynamic> cookies,
    Map<String, String> headers) {
  String? allSetCookie = response.headers['set-cookie'];

  if (allSetCookie != null) {
    var setCookies = allSetCookie.split(',');

    for (var setCookie in setCookies) {
      var tempCookies = setCookie.split(';');

      for (var cookie in tempCookies) {
        login_setCookie(cookie, cookies);
      }
    }

    headers['cookie'] = generateCookieHeader(cookies);
  }
}

Future<void> login_setCookie(
    String rawCookie, Map<String, dynamic> cookies) async {
  if (rawCookie.isNotEmpty) {
    var keyValue = rawCookie.split('=');
    if (keyValue.length == 2) {
      var key = keyValue[0].trim();
      var value = keyValue[1];

      // ignore keys that aren't cookies
      if (key == 'path' || key == 'expires') return;

      cookies[key] = value;
    }
  }
}

String generateCookieHeader(Map<String, dynamic> cookies) {
  // var cookieLength = 0;
  String cookie = "";

  for (var key in cookies.keys) {
    if (cookie.isNotEmpty) {
      cookie += ";";
    }

    cookie += key + "=" + cookies[key]!;
  }

  return cookie;
}
