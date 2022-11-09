import 'package:flutter/material.dart';
import 'package:flutter_firebase_users/widgets/app_large_text.dart';
//import 'package:thesisapp_test/widgets/app_short_text.dart';
import 'package:flutter_firebase_users/widgets/navigation_drawer.dart';
import 'package:flutter_firebase_users/widgets/sub_category.dart';

import 'model/business.dart';

class ConsumerPage extends StatefulWidget {
  const ConsumerPage({super.key});

  @override
  State<ConsumerPage> createState() => _ConsumerPageState();
}

class _ConsumerPageState extends State<ConsumerPage>
    with TickerProviderStateMixin {
  final List<Business> businessList = [
    //Personal Care
    Business(
        businessName: "Nailaholics",
        businessDescription: "Nail Salon",
        businessImage: "images/business_logo/nailaholics.jpg",
        businessType: "Salon"),
    Business(
        businessName: "Beauty Loft",
        businessDescription: "Beauty Salon",
        businessImage: "images/business_logo/beautyloft.jpg",
        businessType: "Salon"),
    Business(
        businessName: "David's Salon",
        businessDescription: "Beauty Salon",
        businessImage: "images/business_logo/davids.png",
        businessType: "Salon"),
    Business(
        businessName: "Elitista Salon",
        businessDescription: "Beauty Salon",
        businessImage: "images/business_logo/elitista.jpg",
        businessType: "Salon"),
    Business(
        businessName: "Freshaire Salon",
        businessDescription: "Beauty Salon",
        businessImage: "images/business_logo/freshaire.jpg",
        businessType: "Salon"),
    Business(
        businessName: "Lay Bare Waxing Salon",
        businessDescription: "Waxing Salon",
        businessImage: "images/business_logo/laybare.png",
        businessType: "Salon"),
    Business(
        businessName: "Reyes Haircutters",
        businessDescription: "Beauty Salon",
        businessImage: "images/business_logo/reyeshaircutters.jpg",
        businessType: "Salon"),
    Business(
        businessName: "Going Straight Salon",
        businessDescription: "Beauty Salon",
        businessImage: "images/business_logo/goingstraight.png",
        businessType: "Salon"),
    Business(
        businessName: "Pinky Swear Nails",
        businessDescription: "Nail Salon",
        businessImage: "images/business_logo/pinkyswearnails.jpg",
        businessType: "Salon"),
    Business(
        businessName: "Happy Brows Lipa",
        businessDescription: "Waxing Salon",
        businessImage: "images/business_logo/happybrows.jpg",
        businessType: "Salon"),
    Business(
        businessName: "RC Dental",
        businessDescription: "Dental Clinic",
        businessImage: "images/business_logo/rcdental.jpg",
        businessType: "HealthCare"),
    Business(
        businessName: "Dermacare",
        businessDescription: "Facial Clinic",
        businessImage: "images/business_logo/dermacare.png",
        businessType: "HealthCare"),
    Business(
        businessName: "EO Executive Optical",
        businessDescription: "Optical Clinic",
        businessImage: "images/business_logo/eo.png",
        businessType: "HealthCare"),
    Business(
        businessName: "Ideal Vision",
        businessDescription: "Optical Clinic",
        businessImage: "images/business_logo/idealvision.png",
        businessType: "HealthCare")
  ];
  @override
  Widget build(BuildContext context) {
    List<Business> salons = [];
    List<Business> spas = [];
    List<Business> healthcare = [];

    for (var element in businessList) {
      if (element.businessType == "Salon") {
        salons.add(element);
      } else if (element.businessType == "Spa") {
        spas.add(element);
      } else if (element.businessType == "HealthCare") {
        healthcare.add(element);
      }
    }

    TabController tabController = TabController(length: 2, vsync: this);

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              //categories
              Container(
                alignment: Alignment.centerLeft,
                height: 60,
                child: Align(
                  child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelPadding: const EdgeInsets.only(left: 10, right: 10),
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      //isScrollable: true,
                      tabs: const [
                        Tab(text: "Personal Care"),
                        Tab(text: "Health Care"),
                      ]),
                ),
              ),
              //salon and see more
              //firstlayer]
              Container(
                  height: 500,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 5),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      SubCategoryWidget(businessList: salons, label: 'Salons'),
                      SubCategoryWidget(
                          businessList: healthcare, label: 'HealthCare'),
                    ],
                  )),
              //mema
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AppLargeText(text: "Become a Pro"),
              ),
            ],
          ),
        ));
  }
}
