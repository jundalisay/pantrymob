
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


class Promos extends StatelessWidget {

  // Future<List> getList() async {
  //   http.Response response = await http.get(Uri.parse('http://192.168.1.5:4000/api/promos/'));
  //   List collection = json.decode(response.body);  
  //   return collection.toList();
  // }
  final PromoManager manager = PromoManager(); 

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.cyan[50],      
      appBar: AppBar(
        title: Text('Promos'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            onPressed: (){
              // showSearch(
              //   context: context, 
              //   delegate: Search()
              // );
            }
          ),
          // IconButton(
          //   icon: Icon(FontAwesomeIcons.flag),
          //   // onPressed: () => show_modal('Choose your language (this feature is still under construction', 'English, Chinese, Tieng Viet, Filipino, etc'),
          // ),
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: () { 
              Navigator.push(context,
                MaterialPageRoute(
                  // builder: (context) => WebViewContainer('https://saigon.sora.one/users/sign_in')
                ),
              );
            }, 
            // onPressed: () => show_modal('Choose your language (this feature is still under construction', 'English, Chinese, Tieng Viet, Filipino, etc'),
          ),               
        ]
      ),
      body: StreamBuilder(
        stream: manager.indexList,
        builder: (BuildContext context, AsyncSnapshot<List<Promo>> snapshot) {
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
            List<Promo> promos = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: promos?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Promo item = promos[index];

                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(item.username, style: Theme.of(context).textTheme.headline4),
                    subtitle: Text(
                      item.content != null ? item.content : '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(item.avatar != null ? item.avatar : 'https://sorasystem.sirv.com/admin.png'),
                    ),
                    isThreeLine: true,
                    // onTap: () {
                    //   Navigator.push(context,
                    //     MaterialPageRoute(
                    //       builder: (context) => PromoDetail(item.id.toString())                             
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

class PromoService {
 static Future<List<Promo>> browse({query}) async {
    // final baseUrl   = locator<ServerSelectionService>().server.baseLocationUrl;
    // http.Response response = await http.get(Uri.parse(baseUrl + ApiConstants.ApiPromosPath));
    http.Response response = await http.get(Uri.parse('http://192.168.1.5:4000/api/promos'));
    String data     = response.body;
    List collection = json.decode(data);

    Iterable<Promo> _promos = collection.map((_) => Promo.fromJson(_));

    if (query != null && query.isNotEmpty) {
      _promos = _promos.where((promo) => promo.content.toLowerCase().contains(query),);
    }
    return _promos.toList();
  }
}


class PromoManager {
  Stream<List<Promo>> get indexList => Stream.fromFuture(PromoService.browse());
  Stream<List<Promo>> filteredCollection({query}) => Stream.fromFuture(PromoService.browse(query: query));
}


class Promo {
  final int id;
  final username;
  final content;  
  final avatar;

  Promo.fromJson(Map<String, dynamic> json) :
    id        = json["id"],
    content   = json["content"],
    username   = json["username"],    
    avatar      = json["avatar"];
}

