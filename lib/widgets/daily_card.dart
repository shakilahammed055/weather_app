import 'package:flutter/material.dart';

class DailyCard extends StatelessWidget {
  
 
  final String? imageName;
  final String? value;
  final String? date;
  final String? day;
  final Color?color;
  final bool?hasDivider;
 
  const DailyCard({
    
    Key? key,
    this.imageName,this.value,
    this.date,this.day,this.color,
    this.hasDivider

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/$imageName.png",
          scale: 1,
          ),
        Text(
          "$value",
          style: TextStyle(
         fontSize: 36,
         fontWeight: FontWeight.bold
       ),
        ),
       
        Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "$day",
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 13,
                 fontWeight: FontWeight.bold 
               ),
             ),
             Text(
               "$date",
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 11,
                 fontWeight: FontWeight.bold 
               ),
             )
           ],
         )
      ],
    );
  }
}