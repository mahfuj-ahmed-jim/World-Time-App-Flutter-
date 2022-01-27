import 'dart:async';

import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    // simulate network request for name
    String userName = await Future.delayed(Duration(seconds: 3), () {
      return 'Mahfuj Ahmed Jim';
    });

    // simulate network request for bio
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'Android Developer';
    });

    print('$userName - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('Hey there');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Chooce Location'),
        elevation: 0,
      ),
    );
  }
}
