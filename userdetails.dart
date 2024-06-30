import '../authentication.dart';

class UserDto {
  String? message;
  UserDataStatus userDataStatus;
  UserDetail? userDetail;

  UserDto(this.message, this.userDetail, this.userDataStatus);
}

class UserDetail {
  String? userName;

  UserDetail(this.userName);
}
