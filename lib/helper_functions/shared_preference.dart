import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // we will define the keys
  static String userLoggedInKey = "ISLOGGEDIN";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userUIDKey = "USERUIDKEY";
  static String userProfilePicKey = "USERPROFILEPICKEY";

  // save data to shared preferences
  static Future<bool> saveUserLoggedIn(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserUID(String userUID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userUIDKey, userUID);
  }

  static Future<bool> saveUserProfilePic(String profileUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userProfilePicKey, profileUrl);
  }

  // fetch data
  static Future<bool> getUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey) ?? false;
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey) ?? "";
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey) ?? "";
  }

  static Future<String> getUserUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userUIDKey) ?? "";
  }

  static Future<String> getUserProfilePic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userProfilePicKey) ?? "";
  }

  // clear all data on signout
  // clear all shared preference data
  static clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
