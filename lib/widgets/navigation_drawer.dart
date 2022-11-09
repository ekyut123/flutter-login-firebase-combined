import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_users/pages/navpages/settings_page.dart';
import 'package:flutter_firebase_users/pages/navpages/termsandconditions_page.dart';
import 'package:flutter_firebase_users/pages/navpages/contact-us_page.dart';
import 'package:flutter_firebase_users/pages/navpages/booking-history.dart';
import 'package:flutter_firebase_users/pages/navpages/settings_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});
  Future<void> _signOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.deepOrange,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10.0),
            buildMenuItem(
                text: 'Terms & Conditions',
                icon: Icons.article_outlined,
                onClicked: (() => selectedItem(context, 0))),
            const SizedBox(height: 10.0),
            buildMenuItem(
                text: 'Booking History',
                icon: Icons.history,
                onClicked: (() => bookingHistory(context, 0))),
            const SizedBox(height: 10.0),
            buildMenuItem(
              text: 'Favorites',
              icon: Icons.favorite_border,
            ),
            const SizedBox(height: 10.0),
            buildMenuItem(
              text: 'Contact Us',
              icon: Icons.contacts,
              onClicked: (() => contactUs(context, 0)),
            ),
            const SizedBox(height: 10.0),
            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: (() => settingsPage(context, 0)),
            ),
            const SizedBox(height: 270.0),
            //added for logout -rob :)
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 30, 20),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  child: GestureDetector(
                    onTap: _signOut,
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  settingsPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ));
        break;
      default:
    }
  }

  bookingHistory(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BookingHistory(),
        ));
        break;
      default:
    }
  }

  contactUs(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ContactUs(),
        ));
        break;
      default:
    }
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
    Widget? child,
  }) {
    const color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TermsAndConditions(),
        ));
        break;
      default:
    }
  }
}
