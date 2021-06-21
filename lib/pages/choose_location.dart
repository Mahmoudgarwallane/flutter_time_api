import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time_data_api.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<Time> locations = [
    Time(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'morocco.png'),
    Time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Time(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    Time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    Time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    Time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a location",
        style: TextStyle(
          letterSpacing: 2
        )),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
              
              child: ListTile(
                onTap: ()async{
                  print(locations[index].location);
                  Time time =  await Time(url: locations[index].url,flag: locations[index].flag,location: locations[index].location);
                  await time.get_time();
                  Navigator.pop(context,{"time":time.time,"flag":time.flag,"location":time.location,"is_day":time.is_day}
                );

                },
                title: Text(locations[index].location),
                subtitle: Text("City"),
                trailing: Icon(Icons.flag),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        })
    );
  }
}
