// ignore_for_file: unused_local_variable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_firebase_users/widgets/app_large_text.dart';
import 'package:flutter_firebase_users/widgets/image_banner.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:date_time_picker_widget/date_time_picker_widget.dart';
import '../../widgets/app_long_text.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  //text editing controller for text field
  // TextEditingController dateInput = TextEditingController();
  // TextEditingController timeInput = TextEditingController();
  late String _d1 = "";
  late String _t1 = "";
  // @override
  // void initState() {
  //   timeInput.text = ""; //set the initial value of text field
  //   super.initState();
  // }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // ignore: prefer_const_literals_to_create_immutables
            title: Row(children: [
              const Text(
                //dito lalabas yung pinabook ng user.
                'Confirmation!',
                style: TextStyle(color: Colors.purple),
              )
            ]),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
            _showDialog();
          },
          label: const Text('Book'),
          icon: const Icon(Icons.book),
          backgroundColor: Colors.deepOrange,
        ),
        appBar: AppBar(),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const ImageBanner("images/services/hand-treatment.jpg"),
            const SizedBox(height: 10),
            //service title
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: AppLargeText(text: 'Hand Treatment'),
            ),
            //price
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text('₱ 350.00',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
            //service description
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: AppLongText(
                text:
                    'A manicure is a mostly cosmetic beauty treatment for the fingernails and hands performed at home or in a nail salon. A manicure usually consists of filing and shaping the free edge of nails, pushing and clipping (with a cuticle pusher and cuticle nippers) any nonliving tissue (but limited to the cuticle and hangnails), treatments with various liquids, massage of the hand, and the application of fingernail polish.',
                color: Colors.black,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 24),
                      _dateTimePicker(),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  Widget _dateTimePicker() {
    final dt = DateTime.now();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Date & Time',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 8),
        Text(
          'Date: $_d1  Time: $_t1',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 16),
        DateTimePicker(
          initialSelectedDate: dt,
          startDate: dt.subtract(const Duration(days: 1)),
          endDate: dt.add(const Duration(days: 60)),
          startTime: DateTime(dt.year, dt.month, dt.day, 6),
          endTime: DateTime(dt.year, dt.month, dt.day, 18),
          timeInterval: const Duration(minutes: 30),
          datePickerTitle: 'Pick a date',
          timePickerTitle: 'Pick a time',
          is24h: false,
          numberOfWeeksToDisplay: 4,
          onDateChanged: (date) {
            setState(() {
              _d1 = DateFormat('dd MMM, yyyy').format(date);
            });
          },
          onTimeChanged: (time) {
            setState(() {
              _t1 = DateFormat('hh:mm:ss aa').format(time);
            });
          },
        )
      ],
    );
  }
}
