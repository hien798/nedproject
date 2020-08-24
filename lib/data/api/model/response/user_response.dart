import 'package:nedproject/data/models/user.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_response.jser.dart';

class UserResponse {
  @Alias('user', isNullable: false)
  final User user;

  UserResponse({
    this.user,
  });

  @override
  String toString() {
    return 'UserResponse[user=$user, ]';
  }
}

@GenSerializer(nullableFields: true)
class UserResponseSerializer extends Serializer<UserResponse>
    with _$UserResponseSerializer {}