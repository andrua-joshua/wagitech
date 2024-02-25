import 'package:flutter/material.dart';
import 'package:google_challange/wagitek/screen/home_screen/widgets/hub_tab_widgets.dart';

class HubTab extends StatefulWidget{
  const HubTab({super.key});

  @override
  HubTabState createState() => HubTabState();


}

class HubTabState extends State<HubTab>{

  int currentIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "WAGITECH",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),

            actions: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.filter_list)),
              
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.notifications))
            ],
          ),

          body: SafeArea(
            child: Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrilloxTabs(currentIndex: currentIndex, 
                  onChange: (v){
                    setState(() {
                      currentIndex = v;
                    });
                  }),

                  const Expanded(
                    child: SingleChildScrollView(
                      child: HubInfoAll(),
                    ))
                ],
              ),)),
    );
  }
}