import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantrymob/navs/drawer.dart';
import 'package:pantrymob/details/webview.dart';


class Index extends StatelessWidget {
  // goToNext() {
  //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
  //   navigator.push(MaterialPageRoute(builder: (context) => Profile()));
  //   //Get.to(Second());
  // }

  // _showSnackBar() {
  //   Get.snackbar(
  //     "My Points",
  //     "Bottle Points: 0, Plastic Points: 0, Compost Points: 0",
  //     snackPosition: SnackPosition.BOTTOM,
  //   );
  // }

  // _showDialog() {
  //   Get.defaultDialog(
  //     title: "Simple Dialog",
  //     content: Text("Too Easy"),
  //   );
  // }

  // _showBottomSheet() {
  //   Get.bottomSheet(
  //     Container(
  //       child: Wrap(
  //         children: <Widget>[
  //           ListTile(
  //               leading: Icon(Icons.music_note),
  //               title: Text('Music'),
  //               onTap: () => {}),
  //           ListTile(
  //             leading: Icon(Icons.videocam),
  //             title: Text('Video'),
  //             onTap: () => {},
  //           ),
  //           SizedBox(
  //             height: 100,
  //           ),
  //         ],
  //       ),
  //     ),
  //     backgroundColor: Colors.white,
  //   );
  // }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      backgroundColor: Colors.cyan[50],
      drawer: AppDrawer(),      
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[

          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/pantry.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Pantries', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('View the latest Pantries in your city', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              trailing: Icon(Icons.keyboard_arrow_right),
              // onTap: () => goToNext(),
              onTap: () {
                Get.toNamed("/pantries");
              },
            ),
          ), 

          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/pantry2.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Posts', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('View the latest posts in your city', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Get.toNamed("/posts");
              },             
            ),
          ), 

          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/smart.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Promos', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('View the latest promos in your city', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Get.toNamed("/promos");
              },              
              // onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()),);},
            ),
          ), 


          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/selfie600.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Profile', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('View your profile', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              trailing: Icon(Icons.keyboard_arrow_right),     
              onTap: () { 
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => WebViewContainer("http://192.168.1.5:4000/dash")            
                  ),
                );
              },
            ),
          ), 

          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/plastic.png', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Plastic Reference', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Learn about plastics', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              trailing: Icon(Icons.keyboard_arrow_right),                 
              onTap: () {
                Get.toNamed("/plastics");
              },                   
            ),
          ),

          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/compost.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Compost Reference', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Learn about N, P, K', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              trailing: Icon(Icons.keyboard_arrow_right),              
              onTap: () {
                Get.toNamed("/composts");
              },
            ),
          ),
          // RaisedButton(
          //   child: Text("Points"),
          //   onPressed: _showSnackBar,
          // ),
        ]
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     RaisedButton(
        //       child: Text("Go To Second"),
        //       onPressed: () => goToNext(),
        //     ),
        //     // RaisedButton(
        //     //   child: Text("Bottom Sheet"),
        //     //   onPressed: _showBottomSheet,
        //     // ),
        //     SizedBox(
        //       height: 40,
        //     ),
        //     RaisedButton(
        //       child: Text("Name Route: /profile"),
        //       onPressed: () {
        //         Get.toNamed("/profile");
        //       },
        //     )
        //   ],
        // ),
      ),
    );
  }
}