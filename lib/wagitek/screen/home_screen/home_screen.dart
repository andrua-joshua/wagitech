import 'package:flutter/material.dart';
import 'package:google_challange/wagitek/screen/home_screen/tabs/hub.dart';
import 'package:google_challange/wagitek/screen/home_screen/tabs/more.dart';
import 'package:google_challange/wagitek/screen/home_screen/tabs/partitcipate.dart';

class WagiTechHomeScreen extends StatefulWidget{
    const WagiTechHomeScreen({super.key});

    @override
    WagiTechHomeState createState() => WagiTechHomeState();

}


class WagiTechHomeState extends State<WagiTechHomeScreen>{

    int currentIndex = 0;

    @override
    Widget build(BuildContext context){
        return Scaffold(
          
          body: currentIndex==0?
                const HubTab()
                :currentIndex == 1?
                const ParticipateTab()
                :const MoreTab(),
          
          bottomNavigationBar: BottomNavigationBar(
            onTap: (v){
              setState(() {
                currentIndex = v;
              });
            },
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                label: "Hub",
                icon: Icon(Icons.hub)),

              BottomNavigationBarItem(
                label: "Participate",
                icon: Icon(Icons.how_to_reg_outlined)),
              
              BottomNavigationBarItem(
                label: "More",
                icon: Icon(Icons.more_horiz))
            ]),
        );
    }
    
}