import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location for the ui
  late String time; // time for that location
  late String flag; // url for assest icon
  late String urlEndPoint; // location url for api end point
  late bool isDayTime; // day time or not

  WorldTime(
      {required this.location, required this.flag, required this.urlEndPoint});

  Future<void> getTime() async {
    // get the response
    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$urlEndPoint'));
      Map data = jsonDecode(response.body);

      // get properties
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // convert to dateTime
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set value for class
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      print(now.hour);
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'failed to get the time';
    }
  }
}
