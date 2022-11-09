// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_firebase_users/model/business.dart';
import 'package:flutter_firebase_users/widgets/app_short_text.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/navigation_drawer.dart';
import '../businesspages/beautyload_page.dart';
import '../businesspages/nailaholics_page.dart';

// ignore: must_be_immutable
class BusinessesList extends StatelessWidget {
  final List<Business> businessList;
  final String label;

  const BusinessesList(
      {super.key, required this.label, required this.businessList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: SizedBox(
          height: 40.0,
          child: Image.asset('images/logo.png'),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          // Title Page
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
            child: AppLargeText(text: label),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: businessList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NailaholicsPage()),
                        );
                      }
                      if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BeautyLoftPage()),
                        );
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.9, vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 55,
                                    height: 55.0,
                                    color: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      child: Image.asset(
                                          businessList[index].businessImage),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AppLargeText(
                                          text:
                                              businessList[index].businessName),
                                      AppShortText(
                                          text: businessList[index]
                                              .businessDescription,
                                          color: Colors.black)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
