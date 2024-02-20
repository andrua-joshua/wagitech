import 'package:flutter/material.dart';
import 'package:google_challange/screens/login_screen/widgets/login_screen_widget.dart';
import 'package:google_challange/util/app_constants.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login"),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text(
                  "Login into your Account",
                  style: TextStyle(
                    fontSize: AppConstants.subTitlefontSize,
                    fontWeight: FontWeight.bold
                  ),
                  ),

                SizedBox(height: 10,),
                LoginWidget()
              ],
            ),
          ),
          ),
      ),
    );
  }
}