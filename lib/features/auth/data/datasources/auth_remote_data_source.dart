import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/user_model.dart';

part 'auth_remote_data_source.g.dart';

@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST('/auth/login')
  Future<UserModel> login(@Body() Map<String, dynamic> body);

  @POST('/auth/register')
  Future<UserModel> register(@Body() Map<String, dynamic> body);

  @POST('/auth/logout')
  Future<void> logout();

  @GET('/auth/me')
  Future<UserModel> getCurrentUser();
}