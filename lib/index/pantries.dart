import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:get/route_manager.dart';
import 'package:pantrymob/index/index.dart';

// import 'package:pantrymob/search/pantries.dart';


class Pantries extends StatelessWidget {

  final PantryManager manager = PantryManager(); 

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.cyan[50],      
      appBar: AppBar(
        title: Text('Pantries'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            onPressed: (){
              // showSearch(
              //   context: context, 
              //   delegate: Search()
              // );
            }
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: () { 
              Navigator.push(context,
                MaterialPageRoute(
                  // builder: (context) => WebViewContainer('https://')
                ),
              );
            }, 
          ),               
        ]
      ),
      body: StreamBuilder(
        stream: manager.indexList,
        builder: (BuildContext context, AsyncSnapshot<List<Pantry>> snapshot) {
          if(snapshot.data == null){
            return Column(
              children: <Widget>[
                SizedBox(height: 60.0),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[400])
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'This will load in a few seconds if you are connected to the internet or if there is data',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6
                  ),
                )
              ],
            );
          } else {
            List<Pantry> pantries = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: pantries?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Pantry item = pantries[index];

                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(item.name, style: Theme.of(context).textTheme.headline4),
                    subtitle: Text(
                      item.status != null ? item.status : '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(item.avatar != null ? item.avatar : 'https://sorasystem.sirv.com/admin.png'),
                    ),
                    trailing: ClipRRect(
                      // borderRadius: BorderRadius.circular(5),
                      child: Text(item.status != null ? item.status : 'Closed'),
                    ),                    
                    isThreeLine: true,
                    // onTap: () {
                    //   Navigator.push(context,
                    //     MaterialPageRoute(
                    //       builder: (context) => PantryDetail(item.id.toString())                             
                    //     )
                    //   );
                    // },
                  ),
                );
              },
            );
          }
        }
      ),
    );
  }
}


class PantryService {
 static Future<List<Pantry>> browse({query}) async {
    http.Response response = await http.get(Uri.parse('http://192.168.1.5:4000/api/hubs'));
    String data     = response.body;
    List collection = json.decode(data);

    Iterable<Pantry> _pantries = collection.map((_) => Pantry.fromJson(_));

    if (query != null && query.isNotEmpty) {
      _pantries = _pantries.where((post) => post.name.toLowerCase().contains(query),);
    }
    return _pantries.toList();
  }
}


class PantryManager {
  Stream<List<Pantry>> get indexList => Stream.fromFuture(PantryService.browse());
  Stream<List<Pantry>> filteredCollection({query}) => Stream.fromFuture(PantryService.browse(query: query));
}


class Pantry {
  final int id;
  final name;
  final address;  
  final avatar;
  final landline;
  final slogan;    
  final status;

  Pantry.fromJson(Map<String, dynamic> json) :
    id        = json["id"],
    address   = json["address"],
    name      = json["name"],    
    avatar    = json["avatar"],
    landline  = json["landline"],
    slogan    = json["slogan"],        
    status    = json["status"];      
}
