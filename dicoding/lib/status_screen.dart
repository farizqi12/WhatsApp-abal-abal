import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<StatusScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        // color: Colors.black87,
        child: ListView(children: const <Widget>[
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
            ),
            title: Text('Status 1'),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
            ),
            title: Text('Status 2'),
          ),
          SizedBox(height: 15,),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
            ),
            title: Text('Status 3'),
          ),
          SizedBox(height: 10,)
        ]),
      ),
    );
  }

}