import '../../data/models/account_model.dart';

abstract class RegisterStates{}

class RegisterIntialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
 final AccountModel accountModel;

  RegisterSuccessState(this.accountModel);
}

class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);
}
class RegisterChangePasswordVisibilityState extends RegisterStates{}
