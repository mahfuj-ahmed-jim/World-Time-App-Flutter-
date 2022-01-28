import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wolrd_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(urlEndPoint: 'Europe/London', location: 'London'),
    WorldTime(urlEndPoint: 'Europe/Berlin', location: 'Athens'),
    WorldTime(urlEndPoint: 'Africa/Cairo', location: 'Cairo'),
    WorldTime(urlEndPoint: 'Africa/Nairobi', location: 'Nairobi'),
    WorldTime(urlEndPoint: 'America/Chicago', location: 'Chicago'),
    WorldTime(urlEndPoint: 'America/New_York', location: 'New York'),
    WorldTime(urlEndPoint: 'Asia/Seoul', location: 'Seoul'),
    WorldTime(urlEndPoint: 'Asia/Jakarta', location: 'Jakarta'),
    WorldTime(urlEndPoint: 'Asia/Dhaka', location: 'Dhaka'),
  ];

  void updateTime(int index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    // back to home page and update data
    Navigator.pop(context, {
      'location': worldTime.location,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chooce Location'),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                  print(locations[index].location);
                },
                title: Text(locations[index].location),
              ),
              elevation: 1,
            );
          },
        ),
      ),
    );
  }
}
