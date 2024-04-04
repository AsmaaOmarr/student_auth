import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/user.dart';

class SharedPreferencesService {
  static const String _keyUserList = 'userList';

  // Add a user to the list of users
  static Future<void> addUser(User user) async {
    List<User> userList = await getAllUsers();
    userList.add(user);
    await _saveUserList(userList);
  }

  // Remove a user from the list of users
  static Future<void> removeUser(String email) async {
    List<User> userList = await getAllUsers();
    userList.removeWhere((user) => user.email == email);
    await _saveUserList(userList);
  }

  // Get all users from the list
  static Future<List<User>> getAllUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userStrings = prefs.getStringList(_keyUserList);
    if (userStrings == null) {
      return [];
    }
    return userStrings.map((userString) => User.fromJson(json.decode(userString))).toList();
  }

  // Check if the email exists in the list of users
  static Future<bool> doesEmailExist(String email) async {
    List<User> userList = await getAllUsers();
    return userList.any((user) => user.email == email);
  }

  // Check if the email and password match
  static Future<bool> doEmailAndPasswordMatch(String email, String password) async {
    List<User> userList = await getAllUsers();
    return userList.any((user) => user.email == email && user.password == password);
  }

  // Private method to save the list of users
  static Future<void> _saveUserList(List<User> userList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userStrings = userList.map((user) => json.encode(user.toJson())).toList();
    await prefs.setStringList(_keyUserList, userStrings);
  }
}
