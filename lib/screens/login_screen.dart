import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';
import '../widgets/background_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginScreen> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:
              BackgroundImage(isTransparent: true).backgroundDecoration(),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "+46 000 0000 000",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(onPressed: () {
                print(phoneNumberController.text);
                setState(() {
                  loading = true;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_) {
                      setState(() {
                        loading = false;
                      });
                    },
                    verificationFailed: (e) {
                      setState(() {
                        loading = false;
                      });
                      print(e.toString());
                    },
                    codeSent: (String verificationId, int? token) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => VerifyOTPWidget(
                                    verificationId: verificationId,
                                  )));
                      setState(() {
                        loading = false;
                      });
                    },
                    codeAutoRetrievalTimeout: (e) {
                      print(e.toString());
                      setState(() {
                        loading = false;
                      });
                    });
              })
            ],
          ),
        )
      ],
    );
  }
}

class VerifyOTPWidget extends StatefulWidget {
  final String verificationId;
  const VerifyOTPWidget({required this.verificationId, super.key});

  @override
  State<VerifyOTPWidget> createState() => _VerifyOTPWidgetState();
}

class _VerifyOTPWidgetState extends State<VerifyOTPWidget> {
  bool loading = false;
  final pinController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:
              BackgroundImage(isTransparent: true).backgroundDecoration(),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                controller: pinController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "6 digit code"),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(onPressed: () async {
                setState(() {
                  loading = true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: pinController.text.toString());
                try {
                  await auth.signInWithCredential(credential);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => HomeScreen()));
                } catch (e) {
                  loading = false;
                  print(e.toString());
                }
              })
            ],
          ),
        )
      ],
    );
  }
}
