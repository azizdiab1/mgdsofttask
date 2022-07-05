import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/user_states.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

import '../../presentation/router/strings.dart';

class UserCubit extends Cubit<UserStates>{
  UserCubit() : super(UserIntialState());



  static UserCubit get(context)=>BlocProvider.of(context);
  String name=CacheHelper.getDataFromSharedPreference(key: 'name');
  String email=CacheHelper.getDataFromSharedPreference(key: 'email');
  String phone=CacheHelper.getDataFromSharedPreference(key: 'phone');
  String id=CacheHelper.getDataFromSharedPreference(key: 'id');
  void logOut(context){
    Navigator.pushNamed(context, loginScreen);
    CacheHelper.removeData(key: 'name');
    CacheHelper.removeData(key: 'email');
    CacheHelper.removeData(key: 'phone');
    CacheHelper.removeData(key: 'id');
  }
}