import 'package:flutter/material.dart';

// import 'package:one/navs/bottom.dart';


void main() {
  runApp(Pantry());
}

class Pantry extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.cyan[50], 
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[

          Card(
            child: ListTile(
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(5),
              //   child: Image.asset('assets/incidents.jpg', fit: BoxFit.cover, width: 130.0,) 
              // ),
              // title: Text('Incidents', style: Theme.of(context).textTheme.headline6),
              // subtitle: Text('View the latest incidents in your city', style: Theme.of(context).textTheme.bodyText1),
              // contentPadding: EdgeInsets.all(6.0),
              // trailing: Icon(Icons.keyboard_arrow_right),
              // onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Balance()),);},
            ),
          ),          
          Card(
            child: ListTile(
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(5),
              //   child: Image.asset('assets/woman.jpg', fit: BoxFit.cover, width: 130.0,) 
              // ),
              // title: Text('Posts', style: Theme.of(context).textTheme.headline1),
              // subtitle: Text('Posts from pantries', style: Theme.of(context).textTheme.bodyText1),
              // contentPadding: EdgeInsets.all(6.0),
              // trailing: Icon(Icons.keyboard_arrow_right),
              // onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Articles()),);},
            ),
          ),            
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 1.0,
              color:Colors.grey,
            ),
          ),
        ]
      ),
    );
  }
}
