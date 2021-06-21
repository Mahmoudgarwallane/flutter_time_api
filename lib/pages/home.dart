import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time_data_api.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

   data =  data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
   String bgimg = data["is_day"] ? "day.jpg" :"night.jpg";
   print(data);
    return Scaffold(
      body: SafeArea(
          child:
          Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/$bgimg"),
            fit: BoxFit.cover,)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(

                children: <Widget> [FlatButton.icon(
                  icon:Icon(Icons.location_on),
                  label: Text("Edit location"),
                  color: Colors.white,
                  onPressed: ()async{
                   dynamic result =  await Navigator.pushNamed(context, "/choose_location");
                   setState(() {
                     data = result;
                   });
                   
                  },
      ),SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                  <Widget>[Text(data["location"],style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    letterSpacing: 2,

                  ),
                  ),
                ],

                ),SizedBox(height: 20,),Text(
                    data["time"],style: TextStyle(
                    color: Colors.white,
                  fontSize: 66,
                  letterSpacing: 2,
                  ))],
              ),
            ),
          )
      )
      ,



    );
  }
}
