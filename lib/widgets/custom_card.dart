import 'package:flutter/material.dart';

class Custom_Card extends StatelessWidget {
  final String? lebel;
  final String? imageName;
  final String? value;
  final bool primary;
  final Color?color;
  
  final IconData?icon;
  const Custom_Card({
    Key? key,
    this.lebel,this.imageName,
    this.value,this.icon, 
    this.primary=false,
    this.color
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 132,
      decoration: BoxDecoration(
        color: primary?null:Colors.white,
        gradient:primary? LinearGradient(
        colors: [
           Color(0xff4B3EAE),
           Color(0xff766CC1),
           Color(0xff4B3EAE),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
       ):null,
       borderRadius: BorderRadius.circular(20), 
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text(
            "$lebel",
             style: TextStyle(
             fontSize: 12,
             fontWeight: FontWeight.bold,
             color:primary? Colors.white:Colors.black 
            ),
            ),
         Image.asset(
           "assets/$imageName.png",
           scale: 1.5,
           ),
          Text(
            "$value",
            style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold,
             color: primary?Colors.white:Colors.black 
            ),
            ),
          
               
        ],
      ),
    );
  }
}