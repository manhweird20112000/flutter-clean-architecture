import '../models/user_model.dart';
import '../../../../core/storage/local_storage.dart';
import 'dart:convert';

abstract class AuthLocalDataSource {
  Future<bool> cacheUser(UserModel user);
  Future<UserModel?> getLastUser();
  Future<bool> clearUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalStorage localStorage;
  final String userKey = 'CACHED_USER';

  AuthLocalDataSourceImpl(this.localStorage);

  @override
  Future<bool> cacheUser(UserModel user) async {
    return await localStorage.saveString(userKey, json.encode(user.toJson()));
  }

  @override
  Future<UserModel?> getLastUser() async {
    final jsonString = localStorage.getString(userKey);
    if (jsonString != null) {
      return UserModel.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<bool> clearUser() async {
    return await localStorage.remove(userKey);
  }
}