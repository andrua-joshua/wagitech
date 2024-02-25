// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_challange/router.dart';
import 'package:google_challange/screens/donations_sites_details_screen/widgets/donationSiteDetailsScreen_widget.dart';
import 'package:google_challange/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:google_challange/util/app_constants.dart';

class DonationsSiteDetailsScreen extends StatelessWidget{
  final String donationSite;
  const DonationsSiteDetailsScreen({super.key, required this.donationSite});

  ///donationsite location
  ///open hours
  ///current appointments
  ///start date
  ///end date
  ///register for an appointment

  @override
  Widget build(BuildContext context){

    final donationCenter = FirebaseFirestore.instance
          .collection("donation_centers").doc(donationSite);
    return Scaffold(
      appBar: AppBar(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SliderImagesWidget(),
              const SizedBox(height: 20,),
              SizedBox(
                child: StreamBuilder<DocumentSnapshot>(
                  stream: donationCenter.snapshots(), 
                  builder:(context, snapshot) {
                    if(snapshot.hasData){
                      return UnitSiteWidget(
                        centerId: donationSite ,
                        donationCenter: snapshot.data?.get("donationCenter"), 
                        donationCenterLocation: snapshot.data?.get("centerLocation"), 
                        endDate: snapshot.data?.get("endDate"), 
                        openHours: snapshot.data?.get("openHours"), 
                        currentAppointments: 2);
                    }
                    if(snapshot.hasError){
                      return const Center(
                        child: Text("Error loading data."),
                      );
                    }
                    return const Center(
                      child: Text(
                        "Loading..."
                      ),
                    );
                  },),
              ),
              const SizedBox(height: 40,),
              CreateAppointmentWidget(centerId: donationSite,)
              
            ],
          )),)),
    );
  }
}