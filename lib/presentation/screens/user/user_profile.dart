import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/user_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/user_states.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../widget/material_button.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    AccountModel accountModel;
    return BlocProvider(
        create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit,UserStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("User Data"),

            ),
            body: Container(
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.end
                ,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(left: width*0.1682,top: height*0.1655),
                    child: Text(
                      "Name : ${UserCubit.get(context).name}",
                      style: TextStyle(
                        fontSize: 23,
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.0091,),
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.1682),
                    child: Text(
                      "Email : ${UserCubit.get(context).email}",
                      style: TextStyle(
                        fontSize: 23,
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.0091,),
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.1682),
                    child: Text(
                      "Phone : ${UserCubit.get(context).phone}",
                      style: TextStyle(
                        fontSize: 23,
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding:  EdgeInsets.only(bottom: height*0.0954),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        DefaultButton(onpressed: (){
                          UserCubit.get(context).logOut(context);
                        }, text: "Logout",width: width*0.3707,height: height*0.0701,background: AppColor.red)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
