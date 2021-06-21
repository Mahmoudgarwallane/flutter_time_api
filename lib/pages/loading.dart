import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time_data_api.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
String time ;

void get_it() async{
  Time time = await Time(url: "Africa/Casablanca",flag: "morocco.png",location: "Casablanca");
  await time.get_time();
    Navigator.pushNamed(context, "/home",arguments: {"time":time.time,"flag":time.flag,"location":time.location,"is_day":time.is_day} );

}
  @override
  void initState() {
    super.initState();
    get_it();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 50.0,
        ),

    )
    );
  }
}
