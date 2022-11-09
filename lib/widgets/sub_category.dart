import 'package:flutter/material.dart';
import '../model/business.dart';
import '../pages/navpages/businesses_list.dart';
import 'app_large_text.dart';
import 'app_short_text.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SubCategoryWidget extends StatelessWidget {
  
  final List<Business> businessList;
  final String label;

  List<Business> salons = [];
  List<Business> spas = [];
  List<Business> healthcare = [];

  SubCategoryWidget({super.key, required this.label, required this.businessList});

  @override
  Widget build(BuildContext context) {

  for (var element in businessList) {
    if(element.businessType == "Salon"){
      salons.add(element);
    }else if(element.businessType == "Spa"){
      spas.add(element);
    }else if(element.businessType == "HealthCare"){
      healthcare.add(element);
    }
  }

    return Container(
      height: 400,
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(text: label),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return BusinessesList(businessList: businessList, label: label);
                        })
                        );
                      },
                      child: AppShortText(
                        text: "See more",
                        color: Colors.grey
                      )
                    )
                  ]
            ),
          ),
          //Listof Business on Main Page
          Container(       
            height: 200,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(businessList[index].businessImage),                                
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, right: 20),
                        child: AppShortText(
                          text: businessList[index].businessName,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  );
              }
            ),
          )
        ],
      ),
    );
  }
}