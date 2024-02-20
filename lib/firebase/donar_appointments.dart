import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DonarAppointments{

  static Future<void> createAppointment({
    required String centerId
  })async{

    final donationCenter = 
      await FirebaseFirestore.instance.collection("donation_centers")
      .doc(centerId).get();

    final donars = donationCenter.get("donars");
    String? userId;
    if((userId = FirebaseAuth.instance.currentUser?.uid)!=null){
      !donars.contains(userId)?donars.add(userId??""): null;
    }

     await FirebaseFirestore.instance.collection("donation_centers")
      .doc(centerId).update({
        "donars":donars
      });
    

  }

}