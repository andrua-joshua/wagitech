import 'package:flutter/material.dart';
import 'package:google_challange/wagitek/screen/home_screen/widgets/more_tab_widgets.dart';

class MoreTab extends StatelessWidget{
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explore More",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle:  false,
        automaticallyImplyLeading: false,
      ),

      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleAndBorderWidget(
                  title: "Mentorship", 
                  children: [
                    Text(
                      "Mentors",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    
                    Text(
                      "Mentees",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),

                    Text(
                      "Stories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                  ]),
                SizedBox(height: 10,),
                TitleAndBorderWidget(
                  title: "Training", 
                  children: [
                    Text(
                      "Tutorials",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    
                    Text(
                      "Micro-courses",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                  ]),
                SizedBox(height: 10,),
                TitleAndBorderWidget(
                  title: "Support", 
                  children: [
                    Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    
                    Text(
                      "Help",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),

                    Text(
                      "Feedback",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                  ]),
                SizedBox(height: 10,),
                TitleAndBorderWidget(
                  title: "Legal", 
                  children: [
                    Text(
                      "Privacy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                  ]),
                  SizedBox(height: 30,),
                  LoginBtn()
              ],
            ),
          ),)),
    );
  }
}