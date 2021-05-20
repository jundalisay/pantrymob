// import 'package:one/navs/bottom.dart';
// void main() => runApp(GetMaterialApp(home: Home()));

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantrymob/index/index.dart';
import 'package:pantrymob/index/composts.dart';
import 'package:pantrymob/index/pantries.dart';
import 'package:pantrymob/index/plastics.dart';
import 'package:pantrymob/index/posts.dart';
import 'package:pantrymob/index/promos.dart';



void main() {
  runApp(Pantry());
}

class Pantry extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Index(),
      debugShowCheckedModeBanner: false,
      title: 'Pantry',
      theme: ThemeData(
        // primaryColor: Colors.teal[400],
        // accentColor: Colors.white,
        primaryColor: Colors.blue[700],
        accentColor: Colors.white,        
        fontFamily: 'Cabin',
        textTheme: TextTheme(
          // h1 a
          // headline1: TextStyle(fontSize: 24.0, color: Colors.teal[400]),
          headline1: TextStyle(fontSize: 24.0, color: Colors.blue[700]),          
          // h1
          headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          // h2
          headline3: TextStyle(fontSize: 20.0),
          // h2 a
          headline4: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
          // headline4: TextStyle(fontSize: 18.0, color: Colors.teal[400]),
          // button white text
          headline5: TextStyle(fontSize: 16.0, color: Colors.white),
          // search gray
          headline6: TextStyle(fontSize: 16.0, color: Colors.grey),
          bodyText1: TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(0.8)),
          bodyText2: TextStyle(fontSize: 12.0, color: Colors.black.withOpacity(0.8)),
        ),
      ),
      getPages: [
        GetPage(name: '/', page: () => Index()),
        GetPage(name: '/composts', page: () => Composts()),
        GetPage(name: '/plastics', page: () => Plastics()),
        GetPage(name: '/pantries', page: () => Pantries()),        
        GetPage(name: '/posts', page: () => Posts()),
        GetPage(name: '/promos', page: () => Promos()),                 
        // GetPage(
        //   name: '/third',
        //   page: () => Third(),
        //   transition: Transition.zoom,
        // ),
        // GetPage(name: "/fourth", page: () => Fourth()),
      ],
    );
  }
}


// void main() {
//   runApp(Pantry());
// }

// class Pantry extends StatelessWidget {

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pantry',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }


// class Home extends StatelessWidget {

//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Colors.cyan[50], 
//       body: ListView(
//         padding: EdgeInsets.all(8),
//         children: <Widget>[

//           Card(
//             child: ListTile(
//               // leading: ClipRRect(
//               //   borderRadius: BorderRadius.circular(5),
//               //   child: Image.asset('assets/incidents.jpg', fit: BoxFit.cover, width: 130.0,) 
//               // ),
//               // title: Text('Incidents', style: Theme.of(context).textTheme.headline6),
//               // subtitle: Text('View the latest incidents in your city', style: Theme.of(context).textTheme.bodyText1),
//               // contentPadding: EdgeInsets.all(6.0),
//               // trailing: Icon(Icons.keyboard_arrow_right),
//               // onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Balance()),);},
//             ),
//           ),          
//           Card(
//             child: ListTile(
//               // leading: ClipRRect(
//               //   borderRadius: BorderRadius.circular(5),
//               //   child: Image.asset('assets/woman.jpg', fit: BoxFit.cover, width: 130.0,) 
//               // ),
//               // title: Text('Posts', style: Theme.of(context).textTheme.headline1),
//               // subtitle: Text('Posts from pantries', style: Theme.of(context).textTheme.bodyText1),
//               // contentPadding: EdgeInsets.all(6.0),
//               // trailing: Icon(Icons.keyboard_arrow_right),
//               // onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Articles()),);},
//             ),
//           ),            
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Container(
//               height: 1.0,
//               color:Colors.grey,
//             ),
//           ),
//         ]
//       ),
//     );
//   }
// }
