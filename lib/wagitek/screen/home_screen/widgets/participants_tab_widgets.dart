import 'package:flutter/material.dart';
import 'package:google_challange/util/app_constants.dart';

class ParticipateWidget extends StatefulWidget{
  const ParticipateWidget({super.key});

  @override
  ParticipateState createState() => ParticipateState();

}

class ParticipateState extends State<ParticipateWidget>{
  
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController interestsController = TextEditingController();
  final TextEditingController instituteController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  bool passwordIsVisible = false;

  @override
  void dispose(){

    fullNameController.dispose();
    emailController.dispose();
    contactController.dispose();
    interestsController.dispose();
    instituteController.dispose();
    commentController.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context){
    return Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Name",
            style: TextStyle(
              fontSize: AppConstants.defaultfontSize,
              fontWeight: FontWeight.bold,
              color: Colors.purple //Color.fromARGB(255, 114, 114, 114)
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2)
            ),
            padding: const EdgeInsets.all(5),
            child:TextFormField(
            controller: fullNameController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your full name",
              hintStyle: TextStyle(
                color: Colors.grey
              )
            ),
          )),

          const SizedBox(height: 10,),

          const Text(
            "Email",
            style: TextStyle(
              fontSize: AppConstants.defaultfontSize,
              fontWeight: FontWeight.bold,
              color: Colors.purple //Color.fromARGB(255, 114, 114, 114)
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2)
            ),
            padding: const EdgeInsets.all(5),
            child:TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "example@gmail.com",
              hintStyle: TextStyle(
                color: Colors.grey
              )
            ),
          )),

          const SizedBox(height: 10,),

          const Text(
            "Contact",
            style: TextStyle(
              fontSize: AppConstants.defaultfontSize,
              fontWeight: FontWeight.bold,
              color: Colors.purple //Color.fromARGB(255, 114, 114, 114)
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2)
            ),
            padding: const EdgeInsets.all(5),
            child:TextFormField(
            controller: contactController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "e.g +256 778534728",
              hintStyle: TextStyle(
                color: Colors.grey
              )
            ),
          )),

          const SizedBox(height: 10,),

          const Text(
            "School/Institute/Organisation",
            style: TextStyle(
              fontSize: AppConstants.defaultfontSize,
              fontWeight: FontWeight.bold,
              color: Colors.purple //Color.fromARGB(255, 114, 114, 114)
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2)
            ),
            padding: const EdgeInsets.all(5),
            child:TextFormField(
            controller: instituteController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Select School, Institute or Organisation",
              hintStyle: TextStyle(
                color: Colors.grey
              )
            ),
          )),

          const SizedBox(height: 10,),

          const Text(
            "Interest",
            style: TextStyle(
              fontSize: AppConstants.defaultfontSize,
              fontWeight: FontWeight.bold,
              color: Colors.purple //Color.fromARGB(255, 114, 114, 114)
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2)
            ),
            padding: const EdgeInsets.all(5),
            child:TextFormField(
            controller: interestsController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "I'm interested in...",
              hintStyle: TextStyle(
                color: Colors.grey
              )
            ),
          )),

          const SizedBox(height: 10,),

          const Text(
            "Comment",
            style: TextStyle(
              fontSize: AppConstants.defaultfontSize,
              fontWeight: FontWeight.bold,
              color: Colors.purple //Color.fromARGB(255, 114, 114, 114)
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2)
            ),
            padding: const EdgeInsets.all(5),
            child:TextFormField(
            controller: commentController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Share your views",
              hintStyle: TextStyle(
                color: Colors.grey
              )
            ),
          )),
          
          const SizedBox(height: 20,),
          TextButton(
            onPressed: ()async{
              
            }, 
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.purple 
              ),

              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15
              ),
              child: const Center(
                child: Text(
                  "Send",
                  style: TextStyle(
                    fontSize: AppConstants.defaultfontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
              ),
            )),
        ],
      ),
    );
  }
}