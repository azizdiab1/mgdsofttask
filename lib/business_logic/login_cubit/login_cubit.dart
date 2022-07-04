import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_states.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginIntialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  late AccountModel accountModel;
  void logIn({
  required String email,
    required String password
}){
    DioHelper.postData(
        url: LOGIN,
        body: {
          'email':email,
          'password':password
        }
    ).then((value){
      debugPrint(value.data);
      accountModel=AccountModel.fromJson(value.data);
      emit(LoginSuccessState(accountModel));
    }).catchError((error){
      debugPrint(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
  bool isPasswordHidden=true;
  IconData suffix=Icons.visibility_off;
  void changePasswordVisibility(){
    isPasswordHidden= !isPasswordHidden;

    suffix=isPasswordHidden ? Icons.visibility_off:Icons.visibility  ;
    emit(LoginChangePasswordVisibilityState());
  }
}