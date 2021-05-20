import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Composts extends StatefulWidget {
  _CompostsState createState() => _CompostsState();
}

class _CompostsState extends State<Composts> {
  List<Compost> composts = [];
  CompostManager compostManager = CompostManager();
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
        title: Text("Composts Reference"),
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
            StreamBuilder<List<Compost>>(
              stream: compostManager.filteredCollection(
                query: _textEditingController.text.toLowerCase().trim()
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("No data");
                } else if (snapshot.hasError) {
                  return Text("Has error");
                } else {
                  composts = snapshot.data;
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
              builder: (context) => CompostScreen(composts[index]),
            ),
          );
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(composts[index].photo, fit: BoxFit.cover, width: 130.0,) 
          ),  
          title: Text("${composts[index].name}"),
          subtitle: Text(
            "${composts[index].description}",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}



class CompostManager {
  final StreamController<int> _compostCount = StreamController<int>();
  Stream<int> get compostCount => _compostCount.stream;
  Stream<List<Compost>> get compostList => Stream.fromFuture(CompostService.composts());
  Stream<List<Compost>> filteredCollection({query}) => Stream.fromFuture(CompostService.composts(query: query));

  CompostManager() {
    compostList.listen((list) => _compostCount.add(list.length));
  }
}


class CompostService {
  static Future<List<Compost>> composts({query}) async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    List composts = [];
    try {
      composts =
        jsonResponse.map((data) => new Compost.fromJson(data)).toList();
    } catch (e) {
      print(e);
      print("CompostService.composts");
      throw e;
    }

    List<Compost> compostList = [];
    composts.forEach((compost) {
      compostList.add(Compost(
        compost.id,
        compost.name,
        compost.photo,
        compost.description,
        compost.instructions,
        compost.precautions,
        compost.examples,        
        )
      );
    });


    if (query == null || query == "") {
      return compostList;
    }
    String searchString = query.toString().toLowerCase();
    
    return compostList
      .where((compost) => (_hasCompostMatched(compost, searchString)))
      .toList();
  }

  static Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/jsons/composts.json");
  }

  static bool _hasCompostMatched(Compost compost, String searchString) {
    if (compost.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < compost.description.length; ++i) {
      if (compost.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    // no match found
    return hasMatched;
  }
}



class Compost {
  final id;
  final name;
  final photo;
  final description;
  final instructions;  
  final precautions;
  final examples;  


  Compost(this.id, this.name, this.photo, this.description, this.instructions, this.precautions, this.examples);

  factory Compost.fromJson(Map<dynamic, dynamic> json) => Compost(
    json["id"],
    json["name"],
    json["photo"],
    json["description"],
    json["instructions"],
    json["precautions"],
    json["examples"]
  );
}



class CompostScreen extends StatelessWidget {
  final Compost compost;
  const CompostScreen(this.compost);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(compost.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset(compost.photo),
            SizedBox(height: 20,),
            Text(
              compost.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 10),
            Text(compost.description),
            SizedBox(height: 20.0),
            Text(
              "sources",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 10),            
            ...compost.examples.map((value) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value, textAlign: TextAlign.left),
                  SizedBox(height: 10.0)
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  _listItems(items) {
    return items.forEach((item) => Text(item));
  }
}
