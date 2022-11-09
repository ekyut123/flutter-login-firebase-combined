import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_users/signup.dart';
import 'package:pinput/pinput.dart';
import 'widgets/loading.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
bool loading = false;

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 46,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
                      child: const Text(
                        "Verification Code",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: const Text(
                    "We have send a verification code to",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    SignupPage.phoneNo,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Pinput(
                        defaultPinTheme: defaultPinTheme,
                        length: 6,
                        controller: pinController,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.greenAccent,
                      color: Colors.black,
                      elevation: 7,
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: SignupPage.verification,
                                  smsCode: pinController.text);
                          try {
                            final User? user =
                                (await _auth.signInWithCredential(credential))
                                    .user;
                            if (user != null) {
                              setState(() {
                                loading = false;
                              });
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/main', (route) => false);
                            }
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "An Error Has Occured. Please Try Again")));
                          }
                        },
                        child: const Center(
                          child: Text(
                            'Verify',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          );
  }
}
