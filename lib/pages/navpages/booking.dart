// ignore_for_file: unused_local_variable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_firebase_users/widgets/app_large_text.dart';
import 'package:flutter_firebase_users/widgets/image_banner.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../widgets/app_long_text.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  //text editing controller for text field
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();

  @override
  void initState() {
    timeInput.text = ""; //set the initial value of text field
    super.initState();
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageBanner("images/hand-treatment.jpg"),
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
                      fontSize: 15,
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
            //date
            Container(
              padding: const EdgeInsets.fromLTRB(50, 5, 150, 0),
              height: MediaQuery.of(context).size.width / 5,
              child: Center(
                child: TextField(
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that the user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      // ignore: avoid_print
                      print(
                          pickedDate); //pickedDate output format => 2022-10-07

                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      // ignore: avoid_print
                      print(
                          formattedDate); //formatted date output using intl package => 2022-10-07
                      setState(() {
                        dateInput.text =
                            formattedDate; //set output date to TextField value
                      });
                    } else {}
                  },
                ),
              ),
            ),
            //time
            Container(
              padding: const EdgeInsets.fromLTRB(50, 5, 150, 0),
              height: MediaQuery.of(context).size.width / 5,
              child: Center(
                child: TextField(
                    controller:
                        timeInput, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.timer), //icon of text field
                        labelText: "Enter Time" //label text of field
                        ),
                    readOnly: true,
                    //set it true, so that the user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      if (pickedTime != null) {
                        // ignore: avoid_print, use_build_context_synchronously
                        print(pickedTime.format(context));
                        DateTime parsedTime = DateFormat.jm()
                            // ignore: use_build_context_synchronously
                            .parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        // ignore: avoid_print
                        print(parsedTime);
                        String formattedTime =
                            DateFormat('HH:mm a').format(parsedTime);
                        // ignore: avoid_print
                        print(formattedTime);
                        //DateFormat() is from intl package, you can format the time on any pattern you need.
                        setState(() {
                          timeInput.text =
                              formattedTime; //set the value of text field
                        });
                      } else {
                        // ignore: avoid_print
                        print("Time is not selected");
                      }
                    }),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text("Jericho"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
