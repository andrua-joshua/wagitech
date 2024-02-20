// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_challange/firebase/donar_appointments.dart';
import 'package:google_challange/router.dart';
import 'package:google_challange/util/app_constants.dart';

class CreateAppointmentWidget extends StatefulWidget{
  final String centerId;
  const CreateAppointmentWidget({
    required this.centerId,
    super.key});

  @override
  CreateAppointmentState createState() => CreateAppointmentState();

}


class CreateAppointmentState extends State<CreateAppointmentWidget>{
  
  bool isApointed = false;

  @override
  Widget build(BuildContext context){
    return   Column(
      children: [
        TextButton(
            onPressed: () async{
              if(FirebaseAuth.instance.currentUser?.uid!=null && !isApointed){
                await DonarAppointments.createAppointment(centerId: widget.centerId);
                setState(() {
                  isApointed = !isApointed;
                });
              }else{
                Navigator.pushNamed(context, RouteGenerator.loginScreen);
              }
            }, 
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: isApointed? Colors.grey: Colors.red 
              ),

              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15
              ),
              child: Center(
                child: Text(
                  "Create Appointment",
                  style: TextStyle(
                    fontSize: AppConstants.defaultfontSize,
                    fontWeight: FontWeight.bold,
                    color: isApointed? const Color.fromARGB(255, 107, 107, 107):  Colors.white
                  ),
                  ),
              ),
            ))
      ],
    );
  }
}


