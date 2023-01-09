enum Navigation { home, gallery, booking, add, login }


// Colors
// Primary rgba(88,167,174,255)
// Secondary rgba(218,229,221,255)

//Secondary rgba(216,232,219,255)
//Color.fromARGB(255, 218, 229, 221),

/*
      appBar: AppBar(
        title: const Text(
          'Sixx Tattoo',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 88, 168, 174),
        foregroundColor: const Color.fromARGB(255, 216, 232, 219),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 216, 232, 219),
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 88, 168, 174),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Color.fromARGB(255, 216, 232, 219),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('View Gallery',
                  style: TextStyle(
                    color: Color.fromARGB(255, 88, 168, 174),
                  )),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Book a tattoo',
                style: TextStyle(
                  color: Color.fromARGB(255, 88, 168, 174),
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 88, 168, 174),
          Color.fromARGB(255, 29, 29, 29),
        ],
      )),
      

      add_photo_alternate_outlined → const IconData
add_photo_alternate — material icon named "add photo alternate" (outlined).
IconData(0xee48, fontFamily: 'MaterialIcons')

adaptiveness: 
---GÄLLER DEVICE HEIGHT/WIDTH---
MediaQuery.of(context).size.height/width * 0.6 = 60% av skärmen
Vill man inkludera appbaren får man sätta den i en variabel:
final appbar = AppBar(title; 'blabla')
appbar: appbar,
height: (MediaQuery.of(context).size.height - appbar.preferredSize.height) * 0.4
Samt statusbaren som man når via:
MediaQuery.of(context).padding.top

---Få fram constraints = LayoutBuilder---
LayoutBuilder(builder: (ctx, constraints){
  return WidgetTree that needs parent constraint info or constraints info
  height: constraints.maxHeight * 0.7 t.ex.
});

---NEKA LANDSCAPE MODE---
import 'package:flutter/services.dart';

void main() 
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
      
**** FÖR ATT SKAPA FIREBASE ANVÄNDARE ****

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "+46 000 0000 000"),
              ),
              SizedBox(height: 20),
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
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                TextFormField(
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "6 digit code"),
                ),
                SizedBox(height: 20),
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
      ),
    );
  }
}
      */