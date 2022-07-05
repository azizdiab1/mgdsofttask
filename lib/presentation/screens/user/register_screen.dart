import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/register_cubit/register_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/register_cubit/register_states.dart';
import 'package:magdsoft_flutter_structure/presentation/router/strings.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../widget/material_button.dart';
import '../../widget/password_field.dart';
import '../../widget/text_field.dart';

class RegisterScreen extends StatelessWidget {
  late var formKey=GlobalKey<FormState>();
  var  nameController=TextEditingController();
  var  passwordController=TextEditingController();
  var  passwordConfirmController=TextEditingController();
  var  phoneController=TextEditingController();
  var  emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    ;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            if(state.accountModel.status==200){
              showToast(state.accountModel.message);
            }else if(state.accountModel.status==405){
              showToast(state.accountModel.message);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.blue
              ),
              child: Form(
                key: formKey,
                child: Column(

                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: height*0.0229),
                      child: Stack(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.054,left: width*0.7487,right: 21),
                            child: DefaultButton(
                                onpressed: (){},
                                text: "عربي",
                                width: 84,
                                height: 31,
                                background: AppColor.white,
                                color: AppColor.blue,
                                size: 15
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.2987),
                            child: Image.asset('assets/images/logo1.png',width: width*0.4053,height: height*0.2069,),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child:
                        Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: height*0.0804,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                              child: DefaultTextField(
                                controller: nameController,
                                labeltext: "Full Name",
                                validate: (String value){
                                  if(value.isEmpty||value==null){
                                    return "Name is empty,enter your Name";
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: height*.0206),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                              child: DefaultTextField(
                                controller: emailController,
                                labeltext: "Email",
                                validate: (String value){
                                  if(value.isEmpty||value==null){
                                    return "Email is empty,enter your Email";
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: height*.0206),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                              child: DefaultTextField(
                                controller: phoneController,
                                labeltext: "phone",
                                validate: (String value){
                                  if(value.isEmpty||value==null){
                                    return "Phone is empty,enter your Phone";
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: height*.0206),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                              child: DefaultPasswordField(
                                  controller: passwordController,
                                isPassword: RegisterCubit.get(context).isPasswordHidden,
                                suffiexPressed:(){ RegisterCubit.get(context).changePasswordVisibility();},

                                  labeltext: "Password",
                                  validate: (String value){
                                    if(value.isEmpty||value==null){
                                      return "Password is empty,enter your password";
                                    }
                                  },
                                sufix: RegisterCubit.get(context).suffix,
                              ),
                            ),
                            SizedBox(height: height*.0206),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                              child: DefaultPasswordField(
                                  controller: passwordConfirmController,
                                  isPassword: RegisterCubit.get(context).isPasswordHidden,
                                  suffiexPressed:(){ RegisterCubit.get(context).changePasswordVisibility();},

                                  labeltext: "Confirm Password",
                                  validate: (String value){
                                    if(value.isEmpty||value==null||passwordConfirmController.text!=passwordController.text){
                                      return "Password dosn't match";
                                    }
                                  },
                                  sufix: RegisterCubit.get(context).suffix,
                              ),
                            ),
                            SizedBox(height: height*0.1050,),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.0853),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DefaultButton(onpressed: (){
                                    if(formKey.currentState!.validate()){
                                      RegisterCubit.get(context).register(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        name: nameController.text,
                                        phone: phoneController.text
                                      );
                                    }
                                  }, text: "Register",width: width*0.3707,height: height*0.0701,background: AppColor.blue),
                                  Spacer(),
                                  DefaultButton(onpressed: (){

                                        Navigator.pushNamed(context, loginScreen);

                                  }, text: "Login",width: width*0.3707,height: height*0.0701,background: AppColor.blue)
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ))
                  ],

                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
