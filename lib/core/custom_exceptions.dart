

class ServerException extends CustomException implements Exception{
  ServerException({String? message}) : super(message!);
}

class ParentLoginException extends CustomException implements Exception{
  ParentLoginException({String? message}) : super(message!);
}
class ParentPackagesException extends CustomException implements Exception{
  ParentPackagesException({String? message}) : super(message!);
}

class OTPVerificationException extends CustomException implements Exception{
  OTPVerificationException({String? message}) : super(message!);
}
class SignUpException extends CustomException implements Exception{
  SignUpException({String? message}) : super(message!);
}
class LoginException extends CustomException implements Exception{
  LoginException({String? message}) : super(message!);
}
class ProfileException extends CustomException implements Exception{
  ProfileException({String? message}) : super(message!);
}
class UpdateDependentException extends CustomException implements Exception{
  UpdateDependentException({String? message}) : super(message!);
}




class CustomException{
  String message;
  CustomException(this.message);
}