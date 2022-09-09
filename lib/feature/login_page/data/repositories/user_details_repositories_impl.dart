import 'package:flutter_login_page/feature/login_page/data/dataSources/user_details_local_data_source.dart';
import 'package:flutter_login_page/feature/login_page/data/models/user_details-model.dart';
import 'package:flutter_login_page/feature/login_page/domain/entities/user_details.dart';
import 'package:flutter_login_page/feature/login_page/domain/repositories/user_details_repositories.dart';

class UserDetailsRepositoryImpl implements UserDetailsRepositories {
  final UserDetailsLocalDataSource localDataSource;

  UserDetailsRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> checkLoginData(String emailId, String password) async {
    return localDataSource.checkLoginData(emailId, password);
  }

  @override
  Future<UserDetails> getUserDetails() {
    return localDataSource.getUserDetails();
  }

  @override
  Future<bool> isRemember() {
    return localDataSource.isRemember();
  }

  @override
  Future setRememberData(bool value) {
    return localDataSource.setRememberData(value);
  }

  @override
  Future setUserDetails(UserDetails userDetails) {
    return localDataSource.setUserDetails(UserDetailsModel(
        name: userDetails.name,
        age: userDetails.age,
        emailId: userDetails.emailId,
        password: userDetails.password));
  }

  @override
  Future<String> getScreenName() {
    return localDataSource.getScreenName();
  }

  @override
  Future setScreenName(String screenName) {
    return localDataSource.setScreenName(screenName);
  }
}
