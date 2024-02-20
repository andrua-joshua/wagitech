import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_challange/router.dart';
import 'package:google_challange/util/app_colors.dart';
import 'package:google_challange/util/app_constants.dart';

class UserDetailsWidget extends StatelessWidget{
  const UserDetailsWidget({super.key});


  @override
  Widget build(BuildContext context){
    final donarsCollection = FirebaseFirestore.instance.collection("donar_user");

    return FirebaseAuth.instance.currentUser?.uid!=null?  StreamBuilder<DocumentSnapshot>(
      stream: donarsCollection.doc(
        FirebaseAuth.instance.currentUser?.uid
      ).snapshots(), 
      builder:(context, snapshot) {
        
        if(snapshot.hasError){
          return const Center(child: Text("loading Faild.."),);
        }
        if(snapshot.hasData){
          return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20,),
        const CircleAvatar(
         radius: 70,
         backgroundColor: AppColors.cardsColor, 
        ),
        const SizedBox(),
        Text(
          snapshot.data?.get("fullname"),
          style: const TextStyle(
            fontSize:  AppConstants.subTitle2fontSize,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(),
        Text(
          snapshot.data?.get("email"),
          style: const TextStyle(
            fontSize: AppConstants.defaultfontSize,
            fontWeight: FontWeight.w500
          ),
        ),

        const SizedBox(),
        Text(
          snapshot.data?.get("contact"),
          style: const TextStyle(
            fontSize:  AppConstants.defaultfontSize
          ),
        ),

        const SizedBox(height: 20,),
        const Text(
          "My Donations",
          style: TextStyle(
            fontSize: AppConstants.subTitlefontSize,
            fontWeight: FontWeight.bold
          ),
        ),
        const Divider(thickness: 1, color: Colors.grey,),
        SizedBox(
          child: Column(
            children: List.generate(
              5, (index) => const UnitDonationWidget(
                centerLocation: "Bweyogerere" , 
                date: "21st Feb, 2021", 
                donationCenter: "Gwatiro Hospital")),
          ),
        )

      ],
    );

        }
        return const Center(child: Text("loading.."),);
      },) 
      : TextButton(
            onPressed: () => Navigator.pushNamed(context, RouteGenerator.loginScreen), 
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.cardsColor 
              ),

              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15
              ),
              child: const Center(
                child: Text(
                  "Login", 
                  style: TextStyle(
                    fontSize: AppConstants.defaultfontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              ),
            ));
  }
}



class UnitDonationWidget extends StatelessWidget{
  final String date;
  final String donationCenter;
  final String centerLocation;
  const UnitDonationWidget({
    required this.centerLocation,
    required this.date,
    required this.donationCenter,
    super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10
      ),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donationCenter,
                  style: const TextStyle(
                    fontSize: AppConstants.subTitle2fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(),
                SizedBox(
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red,),
                      Text(
                        centerLocation,
                        style: const TextStyle(
                          fontSize: AppConstants.defaultfontSize
                        ),
                        )
                    ],
                  ),
                )
              ],
            )),
          const SizedBox(width: 5,),
          Text(
            date,
            style: const TextStyle(
              fontSize: AppConstants.subTitle2fontSize,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500
            ),)
        ],
      ),
    );
  }
}