import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class Time {

  String location;
  String time;
  String flag;
  String url;
  bool is_day;
  Time({String url,String time,String flag,String location}){
    this.url = url;
    this.flag = flag;
    this.location = location;
    this.time = time;

  }

 Future <void> get_time() async{

  try{
    Response response = await  get("http://worldtimeapi.org/api/timezone/$url");
    Map data = jsonDecode(response.body);

    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);
    print(offset);
    DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));
  print(now);
  is_day = now.hour > 6 && now.hour < 20 ? true : false ;

  time = DateFormat.jm().format(now);


  }catch(error){
    print("waaaaaaaaaaaaaaaaaaaaa"+ error);
    time = "impossible";
  }


}





}