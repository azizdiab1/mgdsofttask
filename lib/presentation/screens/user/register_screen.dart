import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../widget/material_button.dart';
import '../../widget/password_field.dart';
import '../../widget/text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    TextEditingController email=TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.blue
        ),
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
            Expanded(child: Container(
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
                          controller: email,
                          labeltext: "Full Name",
                          validate: (){},
                      ),
                    ),
                    SizedBox(height: height*.0206),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                      child: DefaultTextField(
                          controller: email,
                          labeltext: "Email",
                          validate: (){},
                      ),
                    ),
                    SizedBox(height: height*.0206),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                      child: DefaultTextField(
                          controller: email,
                          labeltext: "phone",
                          validate: (){},
                      ),
                    ),
                    SizedBox(height: height*.0206),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                      child: DefaultPasswordField(
                          controller: email,
                          labeltext: "Password",
                          validate: (){},
                          sufix: Icons.visibility_off
                      ),
                    ),
                    SizedBox(height: height*.0206),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.1529),
                      child: DefaultPasswordField(
                          controller: email,
                          labeltext: "Confirm Password",
                          validate: (){},
                          sufix: Icons.visibility_off
                      ),
                    ),
                    SizedBox(height: height*0.1050,),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.0853),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DefaultButton(onpressed: (){}, text: "Register",width: width*0.3707,height: height*0.0701,background: AppColor.blue),
                          Spacer(),
                          DefaultButton(onpressed: (){}, text: "Login",width: width*0.3707,height: height*0.0701,background: AppColor.blue)
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
    );
  }
}
