import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

abstract class LoginStates{}

class LoginIntialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final AccountModel accountModel;

  LoginSuccessState(this.accountModel);
}

class LoginErrorState extends LoginStates{
  final String error;

  LoginErrorState(this.error);
}
class LoginChangePasswordVisibilityState extends LoginStates{}
