import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Plastics extends StatefulWidget {
  _PlasticsState createState() => _PlasticsState();
}

class _PlasticsState extends State<Plastics> {
  List<Plastic> plastics = [];
  PlasticManager plasticManager = PlasticManager();
  final TextEditingController _textEditingController = TextEditingController();

  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plastics Reference"),
        centerTitle: true,
      ),      
      // drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      child: TextField(
                        controller: _textEditingController,
                        onChanged: (_) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "Search"),
                        textAlignVertical: TextAlignVertical.bottom,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
            ),
            StreamBuilder<List<Plastic>>(
              stream: plasticManager.filteredCollection(
                query: _textEditingController.text.toLowerCase().trim()
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("No data");
                } else if (snapshot.hasError) {
                  return Text("Has error");
                } else {
                  plastics = snapshot.data;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return _information(context, index);
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _information(BuildContext context, int index) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlasticScreen(plastics[index]),
            ),
          );
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(plastics[index].photo, fit: BoxFit.cover, width: 130.0,) 
          ),  
          title: Text("${plastics[index].name}"),
          subtitle: Text(
            "${plastics[index].description}",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}



class PlasticManager {
  final StreamController<int> _plasticCount = StreamController<int>();
  Stream<int> get plasticCount => _plasticCount.stream;
  Stream<List<Plastic>> get plasticList => Stream.fromFuture(PlasticService.plastics());
  Stream<List<Plastic>> filteredCollection({query}) => Stream.fromFuture(PlasticService.plastics(query: query));

  PlasticManager() {
    plasticList.listen((list) => _plasticCount.add(list.length));
  }
}


class PlasticService {
  static Future<List<Plastic>> plastics({query}) async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    List plastics = [];
    try {
      plastics =
        jsonResponse.map((data) => new Plastic.fromJson(data)).toList();
    } catch (e) {
      print(e);
      print("PlasticService.plastics");
      throw e;
    }

    List<Plastic> plasticList = [];
    plastics.forEach((plastic) {
      plasticList.add(Plastic(
        plastic.id,
        plastic.name,
        plastic.photo,
        plastic.description,
        plastic.sources,
        plastic.recyclable
        )
      );
    });

    if (query == null || query == "") {
      return plasticList;
    }
    String searchString = query.toString().toLowerCase();
    
    return plasticList
      .where((plastic) => (_hasPlasticMatched(plastic, searchString)))
      .toList();
  }

  static Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/jsons/plastics.json");
  }

  static bool _hasPlasticMatched(Plastic plastic, String searchString) {
    if (plastic.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < plastic.description.length; ++i) {
      if (plastic.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    // no match found
    return hasMatched;
  }
}



class Plastic {
  final id;
  final name;
  final photo;
  final description;
  final sources;  
  final recyclable;

  Plastic(this.id, this.name, this.photo, this.description, this.sources, this.recyclable);

  factory Plastic.fromJson(Map<dynamic, dynamic> json) => Plastic(
    json["id"],
    json["name"],
    json["photo"],
    json["description"],
    json["sources"],
    json["recyclable"]
  );
}



class PlasticScreen extends StatelessWidget {
  final Plastic plastic;
  const PlasticScreen(this.plastic);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plastic.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset(plastic.photo),
            SizedBox(height: 20,),
            Text(
              plastic.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 10),
            Text(plastic.description),
            SizedBox(height: 20.0),
            Text(
              "sources",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 10),            
            ...plastic.sources.map((value) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value, textAlign: TextAlign.left),
                  SizedBox(height: 10.0)
                ],
              );
            }),
            // SizedBox(height: 20.0),
            // Text(
            //   "Precautions",
            //   style: Theme.of(context).textTheme.headline3,
            // ),
            // SizedBox(height: 10),            
            // ...plastic.precautions.map((value) {
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(value, textAlign: TextAlign.left),
            //       SizedBox(height: 10.0)
            //     ],
            //   );
            // }),
            // SizedBox(height: 20.0),
            // Text(
            //   "Brands",
            //   style: Theme.of(context).textTheme.headline3,
            // ),
            // SizedBox(height: 10),            
            // ...plastic.brands.map((value) {
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(value, textAlign: TextAlign.left),
            //       SizedBox(height: 10.0)
            //     ],
            //   );
            // }),
            // SizedBox(height: 20.0),
            // Text(
            //   "How it works",
            //   style: Theme.of(context).textTheme.headline3,
            // ),
            // SizedBox(height: 10),            
            // Text(plastic.how),            
            // SizedBox(height: 20.0),
            // Text(
            //   "Other Details",
            //   style: Theme.of(context).textTheme.headline3,
            // ),
            // SizedBox(height: 10),            
            // ...plastic.details.map((value) {
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(value, textAlign: TextAlign.left),
            //       SizedBox(height: 10.0)
            //     ],
            //   );
            // }),
          ],
        ),
      ),
    );
  }

  _listItems(items) {
    return items.forEach((item) => Text(item));
  }
}
