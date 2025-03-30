import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login({
        'email': email,
        'password': password,
      });
      
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(
        message: e.response?.data['message'] ?? 'Server error',
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unknown error occurred'));
    }
  }

  @override
  Future<Either<Failure, User>> register(String name, String email, String password) async {
    try {
      final userModel = await remoteDataSource.register({
        'name': name,
        'email': email,
        'password': password,
      });
      
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(
        message: e.response?.data['message'] ?? 'Server error',
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unknown error occurred'));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.clearUser();
      return const Right(true);
    } catch (e) {
      return const Left(ServerFailure(message: 'Failed to logout'));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      // Try to get from local storage first
      final cachedUser = await localDataSource.getLastUser();
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }
      
      // If not in local storage, fetch from API
      final userModel = await remoteDataSource.getCurrentUser();
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // Token expired or invalid
        await localDataSource.clearUser();
        return const Right(null);
      }
      return Left(ServerFailure(
        message: e.response?.data['message'] ?? 'Server error',
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unknown error occurred'));
    }
  }
}