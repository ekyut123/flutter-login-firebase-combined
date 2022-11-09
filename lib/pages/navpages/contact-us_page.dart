import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 250.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: const FractionalOffset(1.0, 0.0),
                  child: const Text(
                    'Contact Us!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 50, 0),
            child: const Text(
              "If you have any questions about these Terms and Conditions, You can contact us:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '\u2022 By sending us an email:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: ' lipa.booking.services.inc@gmail.com',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 15), //<-- SEE HERE
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
