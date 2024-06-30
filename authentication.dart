import 'package:ChatZone/pages/userdetails.dart';

enum ApiStatus { API_SUCCESS, NOT_FOUND, SERVER_ERROR }

enum UserDataStatus {
  AUTHENTICATION_SUCCESS,
  AUTHENTICATION_FAIL,
  USER_NOT_FOUND
}

class AuthenticationServices {
  Future<UserDto> loginUser(
      {required String? user, required String? passWord}) async {
    // Simulated API response
    int statusCode = 200;
    // Simulated user data
    String userData = "auth success";

    ApiStatus? apiStatus;
    UserDataStatus? userDataStatus;

    // Determine API status based on the received status code
    switch (statusCode) {
      case 200:
        apiStatus = ApiStatus.API_SUCCESS;
        break;
      case 404:
        apiStatus = ApiStatus.NOT_FOUND;
        break;
      case 500:
        apiStatus = ApiStatus.SERVER_ERROR;
        break;
      default:
        throw Exception("Unhandled Status Code");
    }

    // Return data to UI based on API status
    switch (apiStatus) {
      case ApiStatus.API_SUCCESS:
        return UserDto("Auth Success", UserDetail("User Information"),
            UserDataStatus.AUTHENTICATION_SUCCESS);
      case ApiStatus.NOT_FOUND:
        return UserDto("User Not Found", null, UserDataStatus.USER_NOT_FOUND);
      case ApiStatus.SERVER_ERROR:
        return UserDto("Auth Fail", null, UserDataStatus.AUTHENTICATION_FAIL);
      default:
        throw Exception("Unhandled API Status");
    }
  }
}
