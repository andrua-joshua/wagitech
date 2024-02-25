import 'package:flutter/material.dart';
import 'package:google_challange/router.dart';
import 'package:google_challange/util/app_constants.dart';

class TitleAndBorderWidget extends StatelessWidget{
  final String title;
  final List<Widget> children;
  const TitleAndBorderWidget({
    required this.title,
    required this.children,
    super.key});

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder:(context, constraints) {
        double width = constraints.maxWidth;
        return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.purple
          ),  
        ),

        Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey, width: 1)
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        )
      ],
    );
      },);
  }
}


class LoginBtn extends StatelessWidget{
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context){
    return TextButton(
            onPressed: ()=> Navigator.pushNamed(context, RouteGenerator.loginScreen), 
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
                  "LogIn",
                  style: TextStyle(
                    fontSize: AppConstants.defaultfontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
              ),
            ));
  }
}