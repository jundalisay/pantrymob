import 'package:flutter/material.dart';
import 'package:pantrymob/index/posts.dart';
import 'package:pantrymob/index/index.dart';
import 'package:pantrymob/index/pantries.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AppDrawer extends StatefulWidget {

  State<StatefulWidget> createState() {
    return _AppDrawerState();
  }
}

class _AppDrawerState extends State<AppDrawer> {

  Widget build(BuildContext context) {
    // final List<String> countries = locator<CityHelper>().getCountriesFromServerList();

  //   Get.defaultDialog(
  //     title: "Simple Dialog",
  //     content: Text("Too Easy"),
  //   );    
    return AlertDialog(
      content: Container(
        child: Wrap(children: [
          SizedBox(height: 5),
          ListTile(
            leading: Icon(FontAwesomeIcons.userEdit), 
            title: Text("Survey"),
            // onTap: (){ 
            //   Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Survey())
            //   );
            // }
          ),
          Text(
            'Choose a city',
          ),
          ExpansionTile(
            title: Text("Luzon"),
            children: [
              ListTile(
                leading: Icon(FontAwesomeIcons.mapMarkerAlt), 
                title: Text("Manila"),
                onTap: () {
                  setState(() {
                    debugPrint("Manila clicked");
                    String url = 'https://manila.sora.one/';
                  });
                },                  
              ),           
              ListTile(
                leading: Icon(FontAwesomeIcons.mapMarkerAlt), 
                title: Text("Makati"),
                onTap: () {
                  setState(() {
                    debugPrint("Makati");
                    String url = 'https://makati.sora.one/';
                  });
                },                  
              ),
            ],
          ),      
          ExpansionTile(
            title: Text("Visayas"),
            children: [
              ListTile(
                leading: Icon(FontAwesomeIcons.mapMarkerAlt), 
                title: Text("Cebu"),
                onTap: () {
                  setState(() {
                    debugPrint("cebu clicked");
                    String url = 'https://cebu.sora.one/';
                  });
                },                  
              ),           
              ListTile(
                leading: Icon(FontAwesomeIcons.mapMarkerAlt), 
                title: Text("Ormoc"),
                onTap: () {
                  setState(() {
                    debugPrint("Ormoc");
                    String url = 'https://ormoc.sora.one/';
                  });
                },                  
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Mindanao"),
            children: [
              ListTile(
                leading: Icon(FontAwesomeIcons.mapMarkerAlt), 
                title: Text("Davao"),
                onTap: () {
                  setState(() {
                    debugPrint("cebu clicked");
                    String url = 'https://davao.sora.one/';
                  });
                },                  
              ),           
              ListTile(
                leading: Icon(FontAwesomeIcons.mapMarkerAlt), 
                title: Text("CDO"),
                onTap: () {
                  setState(() {
                    debugPrint("CDO");
                    String url = 'https://cdo.sora.one/';
                  });
                },                  
              ),
            ],
          ),
          // ...countries.map(
          //   (countryName) => ExpansionTile(
          //     title: Text(countryName),
          //     children: [
          //       ...countryCities(context, countryName)
          //     ],
          //   )
          // ),
        ]),
      ),
    );
  }
}

//   List<Widget> countryCities(BuildContext context, String country) {
//     final List<City> cities = locator<CityHelper>().getCitiesByCountry(country);

//     return [
//       ...cities.map(
//         (one) => ListTile(
//           leading: Icon(FontAwesomeIcons.mapMarkerAlt),
//           title: Text(one.cityName),
//           onTap: () {
//             setState(() {
//               // city = one.cityName;
//               debugPrint("${one.cityName} clicked");
//               locator<ServerSelectionService>().selectServer(
//                   ServerCity(one.baseUrl, one.cityName, one.countryName));
//               // Goto index tab
//               Provider.of<TabIndex>(context, listen: false).selectedIndex(0);
//             });
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     ];
//   }
// }
