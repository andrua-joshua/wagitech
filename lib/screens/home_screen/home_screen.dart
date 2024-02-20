import 'package:flutter/material.dart';
import 'package:google_challange/router.dart';
import 'package:google_challange/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:google_challange/util/app_constants.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "UG Donations",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),

        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.notifications)),
          IconButton(
            onPressed: ()=> Navigator.pushNamed(context, RouteGenerator.profileScreen), 
            icon: const Icon(Icons.account_circle))
        ],
      ),

      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SliderImagesWidget(),
              SizedBox(height: 20,),
              Text(
                "Donation Sites",
                style: TextStyle(
                  fontSize: AppConstants.subTitlefontSize,
                  fontWeight: FontWeight.bold
                ),
                ),
              
              AllDonationSitesWidget()
            ],
          )),)),
    );
  }
}