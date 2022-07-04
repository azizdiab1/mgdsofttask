import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_states.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../widget/email_field.dart';
import '../../widget/material_button.dart';
import '../../widget/password_field.dart';
import '../../widget/text_field.dart';

class LoginScreen extends StatelessWidget {
  @override

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    late var formKey=GlobalKey<FormState>();
    var  emailController=TextEditingController();
    var  passwordController=TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
                  if(state is LoginSuccessState){
                    if(state.accountModel.status==200){
                      showToast("Logedin Successfully");
                    }else if(state.accountModel.status==404){
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
                    /*
                    this is a stack widget contain logo-image and localization button
                    */
                    Padding(
                      padding: EdgeInsets.only(top: height*0.0229),
                      child: Stack(
                        children: [
                          //Localiazation Button
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
                          //Image-logo
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.2987),
                            child: Image.asset('assets/images/logo1.png',width: width*0.4053,height: height*0.2069,),
                          )
                        ],
                      ),
                    ),
                    /*
                    a container widget which represent top-circuler view and contain box of (Email,Password,Login button,Register Button)
                     */
                    Expanded(child: Container(
                      //decoration style of container in login scrren
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: height*0.1919,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                              child: DefaultEmailField(
                                  controller: emailController,
                                  labelText: "Email",
                                  validate: (String value){
                                    if(value.isEmpty||value==null){
                                      return "Email is empty,enter your password";
                                    }
                                  },
                              ),
                            ),
                            SizedBox(height: height*.0206),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                              child: DefaultPasswordField(
                                  controller: passwordController,
                                  labeltext: "Password",
                                  validate: (String value){
                                    if(value.isEmpty||value==null){
                                      return "Password is empty,enter your Email";
                                    }
                                  },
                                  sufix: LoginCubit.get(context).suffix,
                                isPassword: LoginCubit.get(context).isPasswordHidden,
                                suffiexPressed:() {
                                    LoginCubit.get(context).changePasswordVisibility();
                                  }
                              ),
                            ),
                            SizedBox(height: height*0.2011,),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.0853),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DefaultButton(onpressed: (){}, text: "Register",width: width*0.3707,height: height*0.0701,background: AppColor.blue),
                                  Spacer(),
                                  DefaultButton(onpressed: (){
                                    if(formKey.currentState!.validate()){
                                      LoginCubit.get(context).logIn(email: emailController.text, password: passwordController.text);
                                    }
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

  Widget _passwordField(){
    return TextFormField(

    );
  }
}
