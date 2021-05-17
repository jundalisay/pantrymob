// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:pantrymob/index/index.dart';
// import 'package:pantrymob/details/webview.dart';


// class Bottom extends StatefulWidget {

//   State<StatefulWidget> createState() => _BottomState();
// }

// class _BottomState extends State<Bottom> {
//   String _title;


//   final List<TabItem> _tabItems = [
//     // TabItem(
//     //   icon: Icon(FontAwesomeIcons.listAlt),
//     //   title: 'Home',
//     //   widget: Index(),
//     // ),
//     // TabItem(
//     //   icon: Icon(FontAwesomeIcons.bullhorn),
//     //   title: 'Posts',
//     //   widget: Posts(),
//     // ),
//     // TabItem(
//     //   icon: Icon(FontAwesomeIcons.commentAlt),
//     //   title: 'Balance',
//     //   widget: Balance(),
//     // ),
//     // TabItem(
//     //   icon: Icon(FontAwesomeIcons.fileAlt),      
//     //   title: 'Transactions',
//     //   widget: Transactions(),
//     // ),
//   ];

//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   initState() {
//     super.initState();
//     _title = 'Pantry';
//   }

//   Widget build(BuildContext context) {

//     final _index = context.select((TabIndex t) => t.currentIndex);
//     SystemChrome.setEnabledSystemUIOverlays([]);
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text(_title),
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.search),
//             onPressed: (){
//               showSearch(
//                 context: context, 
//                 delegate: Search()
//               );
//             }
//           ),
//           IconButton(
//             icon: Icon(FontAwesomeIcons.flag),
//             onPressed: () => show_modal('Choose your language (this feature is still under construction', 'English, Tagalog, Bisaya, etc'),
//           ),
//           IconButton(
//             icon: Icon(FontAwesomeIcons.bell),
//             // onPressed: () { 
//             //   Navigator.push(context,
//             //     MaterialPageRoute(
//             //       builder: (context) => Notifs()
//             //     ),
//             //   );
//             // },
//           ),               
//         ]
//       ),
//       drawer: AppDrawer(),
//       body: _tabItems[_index].widget,
//       bottomNavigationBar: BottomNavigationBar(
//         // backgroundColor: Colors.teal[400],
//         backgroundColor: Colors.teal[400],
//         currentIndex: _index,
//         elevation: 0.0,
//         onTap: onTabTapped,
//         selectedItemColor: Colors.yellow[600],
//         type: BottomNavigationBarType.fixed,
//         unselectedItemColor: Colors.white,
//         items: [
//           ..._tabItems.map((item) =>
//               BottomNavigationBarItem(icon: item.icon, label: item.title))
//         ],
//       ),
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       Provider.of<TabIndex>(context, listen: false).selectedIndex(index);
//       _title = _tabItems[index].title;
//     });
//   }
  
//   void show_modal(String title, String message) {
//     AlertDialog alert_modal = AlertDialog(
//       title: Text(title, style: Theme.of(context).textTheme.headline4),
//       content: Text(message),
//     );
//     showDialog(
//       context: context,
//       builder: (_) => alert_modal
//     );
//   }  
// }

// class TabItem {
//   final Icon icon;
//   final String title;
//   final Widget widget;

//   TabItem({
//     @required this.icon,
//     @required this.title,
//     @required this.widget,
//   })  : assert(icon != null),
//         assert(widget != null),
//         assert(title != null);
// }

