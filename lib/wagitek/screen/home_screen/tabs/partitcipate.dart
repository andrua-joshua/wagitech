import 'package:flutter/material.dart';
import 'package:google_challange/wagitek/screen/home_screen/widgets/participants_tab_widgets.dart';

class ParticipateTab extends StatelessWidget{
  const ParticipateTab({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Get Involved",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),),
          centerTitle: false,
      ),

      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                "Engage our team to start your journey as a mentor or mentee or partner",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.purple
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  child: ParticipateWidget()
                ))
            ],
          ), )),
    );
  }
}