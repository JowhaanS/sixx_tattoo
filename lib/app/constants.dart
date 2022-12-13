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
      

      */