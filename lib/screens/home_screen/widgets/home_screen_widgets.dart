import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_challange/router.dart';
import 'package:google_challange/util/app_colors.dart';
import 'package:google_challange/util/app_constants.dart';
import 'package:google_challange/util/app_images.dart';

class SliderImagesWidget extends StatelessWidget{
  const SliderImagesWidget({super.key});

  @override
  Widget build(BuildContext context){
    return  Container(
      constraints: const BoxConstraints.expand(
        height: 250
      ),
      margin: const EdgeInsets.only(
        top: 20
      ),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        color: AppColors.cardsColor,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.redCrossImage))
      ),
    );
  }

}


class UnitSiteWidget extends StatelessWidget{
  final String centerId;
  final String donationCenter;
  final String donationCenterLocation;
  final String openHours;
  final int currentAppointments;
  final String endDate;
  const UnitSiteWidget({
    super.key,
    required this.centerId,
    required this.donationCenter,
    required this.donationCenterLocation,
    required this.endDate,
    required this.openHours,
    required this.currentAppointments
    });

  @override
  Widget build(BuildContext context){
    return  GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, RouteGenerator.donationSiteDetailsScreen, arguments: centerId),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
            donationCenter,
            style: const TextStyle(
              fontSize: AppConstants.subTitle2fontSize,
              fontWeight: FontWeight.w500
            ),
            ),
          
          const SizedBox(height: 7,),
          SizedBox(
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined, color: Colors.red,),
                Expanded(child:Text(
                  donationCenterLocation,
                  style: const TextStyle(
                    fontSize: AppConstants.defaultfontSize,
                    fontWeight: FontWeight.w400
                  ),
                  ))
              ],
            ),
          ),

          const SizedBox(height: 7,),

          LabelToValueWidget(label: "Open", value: openHours),
          LabelToValueWidget(label: "End Date", value: endDate),
           

      ],
    ));
  }
}


class LabelToValueWidget extends StatelessWidget{
  final String label;
  final String value;
  const LabelToValueWidget({
    super.key,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Text(
          "$label :",
          style: const TextStyle(
            fontSize: AppConstants.defaultfontSize,
            color: Colors.grey
          ),),
        Text(
          value,
          style: const TextStyle(
            fontSize: AppConstants.defaultfontSize
          ),
          )
      ],
    );
  }
}


class AllDonationSitesWidget extends StatelessWidget{
  const AllDonationSitesWidget({super.key});
  
  
   
  @override
  Widget build(BuildContext context){
    final donationCenters = FirebaseFirestore.instance.collection("donation_centers");
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: donationCenters.snapshots(), 
      builder:(context, snapshot) {
        
        if(snapshot.hasData){
          debugPrint("::::::>>>Data: ${snapshot.data?.docs[0].get("centerLocation")}");
          return Column(
            children: List.generate(
              snapshot.data?.docs.length??0, 
              (index) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10
                ),
                child:UnitSiteWidget(
                centerId: snapshot.data?.docs[index].id??"", 
                donationCenter: snapshot.data?.docs[index].get("donationCenter"), 
                donationCenterLocation: snapshot.data?.docs[index].get("centerLocation"), 
                endDate: snapshot.data?.docs[index].get("endDate"), 
                openHours: snapshot.data?.docs[index].get("openHours"), 
                currentAppointments: 4//snapshot.data?.docs[index].get("donars").length()
                ))),
          );
        }
        else if(snapshot.hasError){
          return const Center(child: Text("Error loading data."),);
        }
        return const Center(child: Text("Loading data...."),);
      },);
  }
}