import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'consumer.dart';
import 'admin.dart';

//the user must have the 'admin' role to acess the admin page,
//otherwise user will go to consumer page
//'admin' must be all lowercase characters
final FirebaseAuth _auth = FirebaseAuth.instance;
final _formKey1 = GlobalKey<FormState>();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorAcc;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    emailController.clear();
    passwordController.clear();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    User? user = _auth.currentUser!;
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();
  }

  // ignore: no_leading_underscores_for_local_identifiers
  void _signIn() async {
    //sign-ins the user using signInWithEmailAndPassword
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
        case "wrong-password":
        case "user-not-found":
          {
            setState(() {
              errorAcc = "Email or Password is incorrect";
            });
            break;
          }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
          stream: _auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              // FirebaseAuth.instance.signOut();
              _formKey1.currentState?.reset();
              return FutureBuilder(
                future: getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        _auth.signOut();
                        //   //^^^^^^^^^^^^^^^^^^^^^^^^^^^
                        //   //NILAGAY KO TO KASI MAY BUG, IBAHIN PAG MAY ORAS HAHAHAHHAH
                      } else {
                        // //checks role in database
                        if (snapshot.data!['role'] == 'admin') {
                          return const AdminPage();
                        } else {
                          return const ConsumerPage();
                        }
                      }

                      // if (snapshot.data!.exists) {
                      //   if (snapshot.data!['role'] == 'admin') {
                      //     return const AdminPage();
                      //   } else {
                      //     return const ConsumerPage();
                      //   }
                      // } else {
                      //   //print("doesnt exist lol");
                      //   //_auth.signOut();

                      // }
                    }
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              );
            } else {
              return Form(
                key: _formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
                          child: const Text(
                            "SRVCS",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 35, left: 20, right: 30),
                      child: Column(children: <Widget>[
                        TextFormField(
                            validator: RequiredValidator(errorText: ""),
                            controller: emailController,
                            decoration: const InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ))),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: RequiredValidator(errorText: ""),
                          decoration: InputDecoration(
                              errorText: errorAcc,
                              labelText: 'PASSWORD',
                              labelStyle: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              )),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: const Alignment(1, 0),
                          padding: const EdgeInsets.only(top: 15, left: 20),
                          child: const InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.greenAccent,
                        color: Colors.black,
                        elevation: 7,
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey1.currentState!.validate()) {
                              _signIn();
                            }
                          },
                          child: const Center(
                            child: Text(
                              'LOGIN',
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
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
