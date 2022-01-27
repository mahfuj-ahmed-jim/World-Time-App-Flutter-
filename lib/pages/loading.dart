import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // get the response
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Dhaka'));
    Map data = jsonDecode(response.body);

    // get properties
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // convert to dateTime
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}
