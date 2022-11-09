import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({super.key});
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.article_outlined,
                    size: 100.0,
                    color: Colors.blue,
                  ),
                  Text(
                    "Terms & Conditions",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Text(
                  "Our Terms and Conditions were last updated on October 20, 2022.",
                  style: TextStyle(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 250, 0),
                child: Text(
                  "1. INTRODUCTION",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "1.1. Please carefully read these Terms and Conditions. You acknowledge that you have read and comprehend the terms that apply to you in these Terms and Conditions by using the Service (as defined). The policies of SRVCS (as defined below) and these Terms and Conditions together form a contract that is enforceable in court (the 'Agreement') (as defined below). The Agreement is applicable to how you use Grab's service. Please stop using the Platform (as defined) or the Service if you do not accept the Terms and Conditions.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "1.2. SRVCS IS A TECHNOLOGY COMPANY WHICH PROVIDES AN APPOINTMENT BOOKING SERVICE TO CONSUMERS. SERVICE MAY BE PROVIDED BY SRVCS OR BY A PARTNER WHEREIN SERVICE ARE PROVIDED BY THE PARTNER AND SRVCS’ MAIN ROLE IS TO CONNECT THE CONSUMER  TO PARTNERS. SRVCS IS NOT RESPONSIBLE FOR THE ACTS AND/OR OMISSIONS OF ANY PARTNER. PARTNERS SHALL BEAR ALL LIABILITY IN RELATION TO SUCH SERVICES. PARTNERS ARE NOT, AND SHALL NOT HOLD THEMSELVES TO BE AN AGENT, EMPLOYEE OR STAFF OF SRVCS AND THE SOLUTIONS SRVCS.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 200, 0),
                child: Text(
                  "2. DEFINITION OF TERMS",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "2.1. Application - refers to the applicable mobile application.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "2.2. Consumers - refers to any end-user of the application.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "2.3. Goal - refers to the linking of Consumer and Partners.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "2.4. Services - refers to the product the Partners provides.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "2.5. Partners - refers to independent third parties who provide the Services to Consumers through the Application",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 238, 0),
                child: Text(
                  "3. Acknowledgment",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "3.1. These are the Terms and Conditions governing the use of SRVCS and the agreement that operates between You and SRVCS. These Terms and Conditions set out the rights and obligations of all users regarding the use of the SRVCS.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "3.2. Your access to and use of SRVCS is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use SRVCS.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "3.3. By accessing or using the SRVCS you agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access SRVCS.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "3.4. You represent that you are over the age of 18. SRVCS does not permit those under 18 to use SRVCS.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "3.5. Your access to and use of SRVCS is also conditioned on Your acceptance of and compliance with the Privacy Policy of SRVCS Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using SRVCS.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 265, 0),
                child: Text(
                  "4. Compatibility",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "4.1. There may be firmware or settings on various network, browser, and device models or versions that are incompatible with SRVCS or any of its component parts. Although we continuously develop the SRVCS to the greatest extent possible, support all commonly used devices and models in markets and all browsers from which the SRVCS is likely to be accessed, we do not guarantee compatibility of the SRVCS with specific mobile devices or other hardware.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 255, 0),
                child: Text(
                  "5. User Accounts",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "5.1. When You create an account with Us, You must provide Us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of Your account on SRVCS",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "5.2 You are responsible for safeguarding the password that You use to access SRVCS and for any activities or actions under Your password, whether Your password is with SRVCS or a Third-Party Social Media Service(s).",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "5.3 You agree not to disclose Your password to any third party. You must notify Us immediately upon becoming aware of any breach of security or unauthorized use of Your account",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "5.4 You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than You without appropriate authorization, or a name that is otherwise offensive, vulgar or obscene.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 280, 0),
                child: Text(
                  "6. PAYMENT",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "6.1 Consumers shall pay all Consumer Fees for all services made available through the Application in full using the method chosen at the time of booking, which may be cash or one of the automated payment options offered on the Application. Any payment made in accordance with such a choice is non-refundable and final.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "6.2 Any transaction on the QR code provided by the business, SRVCS doesn’t have any accountabilities in terms of technical issues.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 245, 0),
                child: Text(
                  "7. CANCELLATION",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 2, 230, 0),
                child: Text(
                  "7.1 For Partners:",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "7.1.1. You may cancel the appointment three (3) hours prior to the booked date and time.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 225, 0),
                child: Text(
                  "7.2 For Consumers:",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "7.2.1. If the consumer decided to cancel the appointed date and time, they shall cancel the booked service on or before 1 hour the said date and time.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 210, 0),
                child: Text(
                  "8. Intellectual Property",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "8.1. You agree that all materials, products, and services provided on this application are the property of SRVCS, its affiliates, directors, officers, employees, agents, suppliers, or licensors including all copyrights, trade secrets, trademarks, patents, and other intellectual property. You also agree that you will not reproduce or redistribute the SRVCS’s intellectual property in any way, including electronic, digital, or new trademark registrations.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "8.2. You grant SRVCS a royalty-free and non-exclusive license to display, use, copy, transmit, and broadcast the content you upload and publish. For issues regarding intellectual property claims, you should contact the company in order to come to an agreement.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 250, 0),
                child: Text(
                  "9. Privacy Policy",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "9.1. As defined by Republic Act No. 10173 or the Data Privacy Act of 2012, SRVCS is the Personal Information Controller and is responsible for ensuring the privacy of the personal information you provide via this booking app. As a result, we will handle your personal data in accordance with the Data Privacy Act of 2012, its implementing rules and regulations, and this Privacy Policy.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 190, 0),
                child: Text(
                  "10. Limitation on liability",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "10.1. SRVCS is not liable for any damages that may occur to you as a result of your misuse of Our Service.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 30, 0),
                child: Text(
                  "10.2. SRVCS reserves the right to edit, modify, and change this Agreement at any time. We shall let our users know of these changes through electronic mail. This Agreement is an understanding between SRVCS and the user, and this supersedes and replaces all prior agreements regarding the use of Our Service.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
