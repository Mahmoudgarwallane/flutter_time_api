import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/choose_location.dart';
void main() {
  runApp(MaterialApp(

    routes: {
      "/":(context) => Loading(),
      "/choose_location":(context) => ChooseLocation(),
      "/home":(context) => Home(),
    },debugShowCheckedModeBanner: false, 
  ));
}
