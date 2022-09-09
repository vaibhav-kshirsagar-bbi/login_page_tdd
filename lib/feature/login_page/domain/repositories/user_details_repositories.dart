import 'package:flutter_login_page/feature/login_page/domain/entities/user_details.dart';

abstract class UserDetailsRepositories {
  Future<UserDetails> getUserDetails();
  Future setUserDetails(UserDetails userDetails);

  Future<bool> isRemember();
  Future setRememberData(bool value);

  Future<String> getScreenName();
  Future setScreenName(String screenName);

  Future<bool> checkLoginData(String emailId, String password);
}
