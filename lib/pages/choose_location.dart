import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('Init state');
  }

  @override
  Widget build(BuildContext context) {
    print('$counter');
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('Chooce Location'),
          elevation: 0,
        ),
        body: RaisedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text('Counter is $counter'),
        ));
  }
}
