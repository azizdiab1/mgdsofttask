import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/register_cubit/register_states.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';

import '../../constants/end_points.dart';
import '../../data/models/account_model.dart';
import '../../data/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterIntialState());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  late AccountModel accountModel;
  void register({
    required String email,
    required String password,
    required String phone,
    required String name,
  }){
    DioHelper.postData(
        url: REGISTER,
        body: {
          'email':email,
          'password':password,
          'name':name,
          'phone':phone,
        }
    ).then((value){
      debugPrint(value.data);
      accountModel=AccountModel.fromJson(value.data);
      emit(RegisterSuccessState(accountModel));
    }).catchError((error){
      debugPrint(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
  bool isPasswordHidden=true;
  IconData suffix=Icons.visibility_off;
  void changePasswordVisibility(){
    isPasswordHidden= !isPasswordHidden;

    suffix=isPasswordHidden ? Icons.visibility_off:Icons.visibility  ;
    emit(RegisterChangePasswordVisibilityState());
  }

}