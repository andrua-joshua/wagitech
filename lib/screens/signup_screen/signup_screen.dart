import 'package:flutter/material.dart';
import 'package:google_challange/screens/signup_screen/widgets/signup_screen_widgets.dart';
import 'package:google_challange/util/app_constants.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign Up"
        ),
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
                  "Create an Account",
                  style: TextStyle(
                    fontSize: AppConstants.subTitlefontSize,
                    fontWeight: FontWeight.bold
                  ),
                  ),

                SizedBox(height: 10,),
                CreateAccountWidget()
              ],
            ),
          ),
          ),
      ),
    );
  }
}