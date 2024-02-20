import 'package:flutter/material.dart';
import 'package:google_challange/screens/profile_screen/widgets/profile_screen_widgets.dart';
import 'package:google_challange/util/app_constants.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            // fontSize: AppConstants.subTitlefontSize
          ),),
      ),

      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(
            child: UserDetailsWidget(),
          ),
          )),
    );
  }
}