import 'package:flutter/material.dart';

class DrilloxTabs extends StatelessWidget{
  final int currentIndex;
  final Function(int) onChange;
  const DrilloxTabs({
    required this.currentIndex,
    required this.onChange,
    super.key});


  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:Row(
      children: [
        TextButton(
          onPressed: () => onChange(0) , 
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentIndex==0? Colors.purple:null
              ),
              padding: const EdgeInsets.all(5),
              child: Text(
                "All",
                style: TextStyle(
                  fontSize: 18,
                  color: currentIndex==0? Colors.white: Colors.purple
                ),
              ),
          )),

          TextButton(
          onPressed: () => onChange(1) , 
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentIndex==1? Colors.purple:null
              ),
              padding: const EdgeInsets.all(5),
              child: Text(
                "Updates",
                style: TextStyle(
                  fontSize: 18,
                  color: currentIndex==1? Colors.white: Colors.purple
                ),
              ),
          )),

          TextButton(
          onPressed: () => onChange(2) , 
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentIndex==2? Colors.purple:null
              ),
              padding: const EdgeInsets.all(5),
              child: Text(
                "Training",
                style: TextStyle(
                  fontSize: 18,
                  color: currentIndex==2? Colors.white: Colors.purple
                ),
              ),
          )),

          TextButton(
          onPressed: () => onChange(3) , 
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentIndex==3? Colors.purple:null
              ),
              padding: const EdgeInsets.all(5),
              child: Text(
                "Stories",
                style: TextStyle(
                  fontSize: 18,
                  color: currentIndex==3? Colors.white: Colors.purple
                ),
              ),
          ))
      ],
    ));
  }
}


class UnitHubInfo extends StatelessWidget{
  final String title;
  final String details;
  final String location;
  const UnitHubInfo({
    super.key,
    required this.title,
    required this.details,
    required this.location
    });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        const SizedBox(height: 10,),
        Text(
          details,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500
          ),),
          const SizedBox(height: 10,),
          SizedBox(
            child: Row(
              children: [
                const Text(
                  "Location: ",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                  ),),

                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),)
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Divider(thickness: 1, color: Colors.grey,),
          const SizedBox(height: 10,),
      ],
    );
  }
}



class HubInfoAll extends StatelessWidget{
  const HubInfoAll({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: List.generate(
        4, 
        (index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: UnitHubInfo(
            title: "WAGITECH Blogging Sympossium", 
            details: "The package argument must be non-null if the font family is defined in a package. It is combined with the fontFamily argument to set the [fontFamily] property.", 
            location: "National ICT Innovation Hub"),)),
    );
  }
}