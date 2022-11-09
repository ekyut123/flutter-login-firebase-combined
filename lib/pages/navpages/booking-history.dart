// ignore_for_file: unnecessary_new
import 'package:flutter/material.dart';

// ignore: camel_case_types
class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
          Card(
              child: ListTile(
            title: Text("#1"),
            subtitle: Text("The battery is full."),
          )),
          Card(
              child: ListTile(
            title: Text("#2"),
            subtitle: Text("The battery is full."),
          )),
          Card(
              child: ListTile(
            title: Text("#3"),
            subtitle: Text("The battery is full."),
          )),
          Card(
              child: ListTile(
            title: Text("#4"),
            subtitle: Text("The battery is full."),
          )),
        ],
      ),
    );
  }
}
