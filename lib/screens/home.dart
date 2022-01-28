import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/screens/details.dart';
import 'package:demo/widgets/custom_card.dart';
import 'package:demo/widgets/column_builder.dart';
import 'package:demo/widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static const String path="HomeScreen";
  
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String baseUrl="https://api.openweathermap.org/";
  final String apiKey="eee222ea3ece225edcedf966de7163ba";
  final String lat= "23.811358633150626";
  final String lon="90.40008671517185";
  final String api="data/2.5/onecall?";
  


  Map weatherData={};
  Future getWeather()async{
    final response = await http.get(Uri.parse(baseUrl+api+"lat=$lat"+"&"+"lon=$lon"+"&exclude=hourly,daily"+"&appid=$apiKey"));
    if(response.statusCode==200){
      setState(() {
        weatherData=jsonDecode(response.body); 
        // print("object:$weatherData");
      });
     
    }
  }
@override
  void initState() {
    getWeather();

    super.initState();
  }

  int convertTemp(temp){
    int result= (temp -273).toInt();
    return result;
  }
 
  

  @override
  Widget build(BuildContext context) {
    print(weatherData);
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          backgroundColor:  Color(0xffF1F0FA),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${weatherData["timezone"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:24
                  ),
               ),
               Text(
                  "${weatherData["timezone_offset"]}",
                  style: TextStyle(
                    
                    fontSize:12
                  ),
               ),
               SizedBox(
                 height: 8,
               ),
                CarouselSlider(
                    options: CarouselOptions(height: 300.0),
                    items: [1,2,3,4,5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return WeatherCard(
                            temp: "${convertTemp(weatherData["current"]["temp"])}",
                            weather:"${weatherData["current"]["weather"][0]["description"]}",
                            dateTime: "${weatherData["current"]["dt"]}",
                          );
                        },
                      );
                    }).toList(),
                  ),
                Container(
                   color: Color(0xff766CC1).withOpacity(0.35),
                  margin: EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Transform.translate(
                        offset: Offset(0,-60),
                        child: Container(
                          height: 122,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ColumnBuilder(
                                  imageName: "Vector",
                                  label: "Humidity",
                                  value: weatherData["current"]["humidity"].toString()
                                ),
                                ColumnBuilder(
                                  imageName: "tabler_wind",
                                  label: "Wind",
                                  value: "${weatherData["current"]["wind_speed"]} km/h",
                                ),
                                ColumnBuilder(
                                  imageName: "Vector (2)",
                                  label: "Air Pressure",
                                  value: "${weatherData["current"]["pressure"]}",
                                ),
                                ColumnBuilder(
                                  imageName: "ic_round-visibility",
                                  label: "Visibility",
                                  value: "${weatherData["current"]["visibility"]/1000}km",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                        Transform.translate(
                          offset:Offset(0,-40),
                          child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Today",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Next 7 Days",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),
                                  ),
                                 IconButton(
                                   onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(
                                       builder: (context)=>DetailsScreen()));
                                   }, 
                                   icon: Icon(Icons.arrow_forward_ios)
                                   )
                                ],
                              )
                            ],
                          ),
                                            ),
                        ),
                      Transform.translate(
                        offset: Offset(0,-40),
                        child: Container(
                            height: 140,
                            margin: EdgeInsets.only(top: 32),
                            child: ListView.builder(
                              // reverse: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Custom_Card(
                                   imageName: "Sun_cloud_angled_rain",
                                   lebel:  "06:00 AM",
                                   value: "23°" , 
                                   primary:index==0?true:false ,
                                  ),
                                );
                              }
                            ),
                          ),
                      ),
                    Divider(
                        thickness: 5,
                        indent: 180,
                        endIndent: 180,
                        color: Colors.white,
          
                       ) 
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




