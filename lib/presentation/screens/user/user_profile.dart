import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../widget/material_button.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
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
                  "Name : Ahmed",
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
                "Email : ahmed@gmail.com",
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
                "Phone : 01152226320",
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

                  DefaultButton(onpressed: (){}, text: "Logout",width: width*0.3707,height: height*0.0701,background: AppColor.red)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
