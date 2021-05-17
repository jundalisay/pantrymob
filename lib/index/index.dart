import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:one/details/webview.dart';
import 'package:one/search/main.dart';
import 'package:one/index/articles.dart';
import 'package:one/index/electronics.dart';
import 'package:one/index/foods.dart';
import 'package:one/index/hotels.dart';
import 'package:one/index/incidents.dart';
import 'package:one/index/needed_services.dart';
import 'package:one/index/learnings.dart';
import 'package:one/index/needed_products.dart';
import 'package:one/index/needed_real_estates.dart';
import 'package:one/index/orgs.dart';
import 'package:one/index/posts.dart';
import 'package:one/index/products.dart';
import 'package:one/index/services.dart';
import 'package:one/index/techjobs.dart';
import 'package:one/index/utilities.dart';



class Index extends StatefulWidget {
  // String url;
  // Index(this.url);
  _IndexState createState() => _IndexState();

}

class _IndexState extends State<Index> {

  // String url;
  // _IndexState(this.url);

  Widget build(BuildContext context) {
    // print(widget.url);
    return Scaffold(
      backgroundColor: Colors.cyan[50], 
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[

          // TEST
          // Card(
          //   child: ListTile(
          //     leading: ClipRRect(
          //       borderRadius: BorderRadius.circular(5),
          //       child: Image.asset('assets/posts.jpg', fit: BoxFit.cover, width: 130.0,) 
          //     ),
          //     title: Text('Posts', style: Theme.of(context).textTheme.headline1),
          //     subtitle: Text('View posts from other users', style: Theme.of(context).textTheme.bodyText1),
          //     contentPadding: EdgeInsets.all(6.0),
          //     // trailing: Icon(Icons.keyboard_arrow_right),
          //     onTap: () {
          //       Navigator.push(context,
          //         MaterialPageRoute(
          //           builder: (context) => WebViewContainer('http://192.168.1.5:4000')                                  
          //         ),
          //       );
          //     }
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     leading: ClipRRect(
          //       borderRadius: BorderRadius.circular(5),
          //       child: Image.asset('assets/posts.jpg', fit: BoxFit.cover, width: 130.0,) 
          //     ),
          //     title: Text('Posts', style: Theme.of(context).textTheme.headline1),
          //     subtitle: Text('View posts from other users', style: Theme.of(context).textTheme.bodyText1),
          //     contentPadding: EdgeInsets.all(6.0),
          //     // trailing: Icon(Icons.keyboard_arrow_right),
          //     onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Posts()),);},
          //     // widget.url
          //   ),
          // ),
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/incidents.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Incidents', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('View the latest incidents in your city', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              // trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Incidents()),);},
            ),
          ),          
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/woman.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Articles', style: Theme.of(context).textTheme.headline1),
              subtitle: Text('Local articles from users', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              // trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Articles()),);},
            ),
          ),            
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 1.0,
              color:Colors.grey,
            ),
          ),          
          // NS
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/jobs.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Local Jobs', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Look for local jobs', style: Theme.of(context).textTheme.bodyText1),        
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => NeededServices()),);},
            ),
          ),
          // Tech jobs
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/techjob600.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('International Tech Jobs', style: Theme.of(context).textTheme.headline4),
              subtitle: Text('See international tech jobs', style: Theme.of(context).textTheme.bodyText1),        
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Techjobs()),);},
            ),
          ),
          // NP 
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/products.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Needed Products', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Look for products needed', style: Theme.of(context).textTheme.bodyText1),          
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => NeededProducts()),);},
            ),
          ),
          // NI
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/rawland.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Needed Real Estate', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Look for needed real estate', style: Theme.of(context).textTheme.bodyText1),              
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => NeededRealEstates()),);},
            ),
          ),          
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 1.0,
              color:Colors.grey,
            ),
          ),
          // SERVICES
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/services.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Services', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Look for available services', style: Theme.of(context).textTheme.bodyText1),            
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Services()),);},
            ),
          ),
          // LEARNINGS
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/learning.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Learnings', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Look for education and learning', style: Theme.of(context).textTheme.bodyText1),              
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Learnings()),);},
            ),
          ),               
          // PRODUCTS
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/naturopathy.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Products', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Look for products for purchase or exchange', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Products()),);},
            ),
          ),                              
          // FOOD   
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/coconut600.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Food', style: Theme.of(context).textTheme.headline1),
              subtitle: Text('Look for food in exchange for cash or barter', style: Theme.of(context).textTheme.bodyText1),              
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Foods()),);},
            ),
          ),
          // HOTELS
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/hotel.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Hotels & Lodging', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Look for available hotels and lodgings', style: Theme.of(context).textTheme.bodyText1),            
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Hotels()),);},
            ),
          ),
          // ELECTRONICS
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/macair.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Electronics', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Find new and second-hand electronics', style: Theme.of(context).textTheme.bodyText1),
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Electronics()),);},
            ),
          ),     
          // FOOD SERVICES
          // Card(
          //   child: ListTile(
          //     leading: ClipRRect(
          //       borderRadius: BorderRadius.circular(5),
          //       child: Image.asset('assets/macair.jpg', fit: BoxFit.cover, width: 130.0,) 
          //     ),
          //     title: Text('Food Services', style: Theme.of(context).textTheme.headline1),
          //     contentPadding: EdgeInsets.all(6.0),
          //     trailing: Icon(Icons.keyboard_arrow_right),
          //     // onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Needs()),);},
          //   ),
          // ),          
          // UTILITIES
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/utility.jpeg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Utilities', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Look for energy and telecoms', style: Theme.of(context).textTheme.bodyText1),              
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Utilities()),);},
            ),
          ),          
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 1.0,
              color:Colors.grey,
            ),
          ),          
          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/company.jpg', fit: BoxFit.cover, width: 130.0,) 
              ),
              title: Text('Companies', style: Theme.of(context).textTheme.headline6),
              subtitle: Text('Check out companies and organizations', style: Theme.of(context).textTheme.bodyText1),              
              contentPadding: EdgeInsets.all(6.0),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Orgs()),);},
            ),
          ),   
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 1.0,
              color:Colors.grey,
            ),
          ),          
          // Card(
          //   child: ListTile(
          //     leading: ClipRRect(
          //       borderRadius: BorderRadius.circular(5),
          //       child: Image.asset('assets/company.jpg', fit: BoxFit.cover, width: 130.0,) 
          //     ),
          //     title: Text('Help', style: Theme.of(context).textTheme.headline1),
          //     subtitle: Text('', style: Theme.of(context).textTheme.bodyText1),              
          //     contentPadding: EdgeInsets.all(6.0),
          //     onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Orgs()),);},
          //   ),
          // ),  
        ],         
      ),
    );
  }
}

