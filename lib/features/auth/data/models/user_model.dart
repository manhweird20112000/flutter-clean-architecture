import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    String? avatar,
    String? token,  // Added token field which might be needed for auth
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  
  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
    name: user.name,
    email: user.email,
    avatar: user.avatar,
  );
  
  // Add this method inside the class
  const UserModel._();
  
  User toEntity() => User(
    id: id,
    name: name,
    email: email,
    avatar: avatar,
  );
}

// You can keep the extension method as well for backward compatibility
extension UserModelX on UserModel {
  // This is now redundant but kept for compatibility
  User toEntity() => User(
    id: id,
    name: name,
    email: email,
    avatar: avatar,
  );
}