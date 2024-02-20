import 'package:flutter/material.dart';
import 'package:google_challange/router.dart';
import 'package:google_challange/util/app_constants.dart';
import 'package:google_challange/util/app_images.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Image.asset(AppImages.donateArtImage),
                  
                  // const Text(
                  //   "Find your donar now with us lets donate.",
                  //   style: TextStyle(
                  //     fontSize: AppConstants.subTitlefontSize
                  //   ),
                  //   ),
                  const SizedBox(height: 20,),
                  TextButton(
                    onPressed: ()=> Navigator.pushNamed(context, RouteGenerator.homeScreen), 
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: AppConstants.subTitle2fontSize,
                        fontWeight: FontWeight.bold,
                      ),)),
                  
                  const SizedBox(height: 50,)
            ],
          ), )),
    );
  }
}