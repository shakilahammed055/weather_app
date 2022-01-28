//https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid=eee222ea3ece225edcedf966de7163ba


import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiController{
  final String baseUrl="https://api.openweathermap.org/";
  final String apiKey="eee222ea3ece225edcedf966de7163ba";
  final String lat= "33.44";
  final String lon="-94.04";
  final String api="data/2.5/onecall?";


  Map weatherData={};
  Future getWeather()async{
    final response=await http.get(Uri.parse(baseUrl+api+"lat=$lat"+"&"+"&exclude=hourly,daily"+"&appid=$apiKey"));
    if(response.statusCode==200){
      weatherData=jsonDecode(response.body);
    }
  }
}