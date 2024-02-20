import 'package:flutter/material.dart';
import 'package:google_challange/firebase/authentication.dart';
import 'package:google_challange/router.dart';
import 'package:google_challange/util/app_colors.dart';
import 'package:google_challange/util/app_constants.dart';

class CreateAccountWidget extends StatefulWidget{
  const CreateAccountWidget({super.key});

  @override
  CreateAppointmentState createState() => CreateAppointmentState();

}

class CreateAppointmentState extends State<CreateAccountWidget>{
  
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordIsVisible = false;

  @override
  void dispose(){

    fullNameController.dispose();
    emailController.dispose();
    contactController.dispose();
    passwordController.dispose();

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
            "Full Name",
            style: TextStyle(
              fontSize: AppConstants.defaultfontSize,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 114, 114, 114)
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
              hintText: "full Name",
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
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 114, 114, 114)
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
              hintText: "Email",
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
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 114, 114, 114)
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
              hintText: "Contact",
              hintStyle: TextStyle(
                color: Colors.grey
              )
            ),
          )),

          const SizedBox(height: 10,),

          const Text(
            "Password",
            style: TextStyle(
              fontSize: AppConstants.defaultfontSize,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 114, 114, 114)
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2)
            ),
            padding: const EdgeInsets.all(5),
            child:TextFormField(
            controller: passwordController,
            obscureText: !passwordIsVisible,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    passwordIsVisible = !passwordIsVisible;
                  });
                } , 
                icon: !passwordIsVisible? const Icon(Icons.visibility)
                 :const Icon(Icons.visibility_off)),
              hintText: "password",
              hintStyle: const TextStyle(
                color: Colors.grey
              )
            ),
          )),
          
          const SizedBox(height: 20,),
          TextButton(
            onPressed: ()async{
              await UserAuth.signUp(
                fullname: fullNameController.text, 
                email: emailController.text, 
                password: passwordController.text, 
                contact: contactController.text);
              Navigator.pushNamed(context, RouteGenerator.homeScreen);
            }, 
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red 
              ),

              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15
              ),
              child: const Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: AppConstants.defaultfontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
              ),
            )),

            const SizedBox(height: 10,),
            const Center(child:Text("OR", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)),
            const SizedBox(height: 10,),
            TextButton(
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
            )),
        ],
      ),
    );
  }
}