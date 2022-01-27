import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:wolrd_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Dhaka', flag: 'bangladesh.png', urlEndPoint: 'Asia/Dhaka');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      'loading',
      style: TextStyle(
        color: Colors.blueAccent,
        fontSize: 30,
      ),
    )));
  }
}
