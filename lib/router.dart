import 'package:flutter/material.dart';
import 'package:google_challange/screens/donations_sites_details_screen/donationSiteDetailsScreen.dart';
import 'package:google_challange/screens/home_screen/home_screen.dart';
import 'package:google_challange/screens/login_screen/login_screen.dart';
import 'package:google_challange/screens/profile_screen/profile_screen.dart';
import 'package:google_challange/screens/signup_screen/signup_screen.dart';
import 'package:google_challange/screens/welcome_screen/welcome_screen.dart';
import 'package:google_challange/wagitek/screen/home_screen/home_screen.dart';

class RouteGenerator{

  static const welcomeScreen = "/";
  static const homeScreen ="/homeScreen";
  static const loginScreen = "/loginScreen";
  static const signupScreen = "/signupScreen";
  static const profileScreen = "/profileScreen";
  static const donationSiteDetailsScreen = "/donationSiteDetailsScreen";

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen());     
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const WagiTechHomeScreen());
      case donationSiteDetailsScreen:
        final String arg = settings.arguments.toString();
        return MaterialPageRoute(
          builder: (context) => DonationsSiteDetailsScreen(donationSite: arg));
      case profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen());
      case signupScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen());
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen());
    }
  }
}