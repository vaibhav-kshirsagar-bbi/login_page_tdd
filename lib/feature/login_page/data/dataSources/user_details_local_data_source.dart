// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_login_page/feature/login_page/data/models/user_details-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_details.dart';

abstract class UserDetailsLocalDataSource {
  Future<UserDetails> getUserDetails();
  Future setUserDetails(UserDetailsModel userDetailsModel);

  Future<bool> isRemember();
  Future setRememberData(bool value);

  Future<String> getScreenName();
  Future setScreenName(String screenName);

  Future<bool> checkLoginData(String emailId, String password);
}

const SCREEN_NAME = 'SCREEN_NAME';
const USER_DETAILS = 'USER_DETAILS';
const BOOL_DATA = ' BOOL_DATA';

class UserDetailsLocalDataSourceImpl implements UserDetailsLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserDetailsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getScreenName() {
    return Future.value(sharedPreferences.getString(SCREEN_NAME));
  }

  @override
  Future<UserDetailsModel> getUserDetails() {
    final jsonString = sharedPreferences.getString(USER_DETAILS);
    return Future.value(UserDetailsModel.fromJson(json.decode(jsonString!)));
  }

  @override
  Future<bool> isRemember() {
    return Future.value(sharedPreferences.getBool(BOOL_DATA));
  }

  @override
  Future setRememberData(bool value) {
    return Future.value(sharedPreferences.setBool(BOOL_DATA, value));
  }

  @override
  Future setScreenName(String screenName) {
    return Future.value(sharedPreferences.getString(SCREEN_NAME));
  }

  @override
  Future setUserDetails(UserDetailsModel userDetailsModel) {
    return Future.value(sharedPreferences.setString(
        USER_DETAILS, userDetailsModel.toJson().toString()));
  }

  @override
  Future<bool> checkLoginData(String emailId, String password) async {
    UserDetailsModel userDetailsModel = await getUserDetails();

    if (userDetailsModel.emailId == emailId &&
        userDetailsModel.password == password) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
