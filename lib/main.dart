import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   return Album.fromJson(jsonDecode(response.body));
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }
  print(jsonDecode(response.body));
  return jsonDecode(response.body);
}

// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    // data12=futureAlbum.dat
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Post Data'),
        ),
        // body: ListView(children: [futureAlbum?.map(e=>return Text(e.title))],)
        body: FutureBuilder<dynamic>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Builder(builder: (context) {
                    return InkWell(
                        child: SizedBox(
                          child: ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text(snapshot.data[index]['title']),
                            subtitle: Text(snapshot.data[index]['body']),
                          ),
                          height: 180,
                        ),
                        onTap: () =>
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(snapshot.data[index]['title']),
                            )));
                  });

                  // print(jsonDecode(jsonEncode(snapshot.data[index]))['title']);
                  // print(index);
                  // return Text("guru");
                },
              );
              // return Text(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

// // import 'dart:developer';
// // import 'package:http/http.dart' as http;

// // import 'package:flutter/material.dart';

// // void main() => runApp(const MaterialApp(home: MyApp2()));

// // class MyApp2 extends StatelessWidget {
// //   const MyApp2({Key? key}) : super(key: key);

// //   Future<List>? getResponse() async {
// //     final url = "https://jsonplaceholder.typicode.com/posts";
// //     final data = await http.get(url);
// //   }

// //   @override
// //   void initState() {
// //     initState();
// //     print('object');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //         child: Scaffold(
// //       body: ListTile(
// //         leading: Icon(Icons.wb_sunny),
// //         title: Text('Sunday'),
// //         subtitle: Text('sunny, h: 80, l: 65'),
// //       ),
// //     ));
// //   }
// // }

// // class MYAPP3 extends StatelessWidget {
// //   const MYAPP3({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: ListTile(
// //         leading: Icon(Icons.wb_sunny),
// //         title: Text('Sunday'),
// //         subtitle: Text('sunny, h: 80, l: 65'),
// //       ),
// //     );
// //   }
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: CustomScrollView(
// //         physics: const BouncingScrollPhysics(
// //             parent: AlwaysScrollableScrollPhysics()),
// //         slivers: <Widget>[
// //           SliverAppBar(
// //             stretch: true,
// //             onStretchTrigger: () {
// //               // Function callback for stretch
// //               return Future<void>.value();
// //             },
// //             expandedHeight: 300.0,
// //             flexibleSpace: FlexibleSpaceBar(
// //               stretchModes: const <StretchMode>[
// //                 StretchMode.zoomBackground,
// //                 StretchMode.blurBackground,
// //                 StretchMode.fadeTitle,
// //               ],
// //               centerTitle: true,
// //               title: const Text('Flight Report'),
// //               background: Stack(
// //                 fit: StackFit.expand,
// //                 children: <Widget>[
// //                   Image.network(
// //                     'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
// //                     fit: BoxFit.cover,
// //                   ),
// //                   const DecoratedBox(
// //                     decoration: BoxDecoration(
// //                       gradient: LinearGradient(
// //                         begin: Alignment(0.0, 0.5),
// //                         end: Alignment.center,
// //                         colors: <Color>[
// //                           Color(0x60000000),
// //                           Color(0x00000000),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           SliverList(
// //             delegate: SliverChildListDelegate(
// //               const <Widget>[
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Sunday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Monday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Sunday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Monday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Sunday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Monday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Sunday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Monday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Sunday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Monday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Sunday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Monday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Sunday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Monday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),

// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Sunday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.wb_sunny),
// //                   title: Text('Monday'),
// //                   subtitle: Text('sunny, h: 80, l: 65'),
// //                 ),
// //                 // ListTiles++
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // import 'package:flutter/material.dart';

// // // void main() => runApp(const MyApp());

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({Key? key}) : super(key: key);

// // //   static const String _title = 'Flutter Code Sample';

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const MaterialApp(
// // //       title: _title,
// // //       home: MyStatefulWidget(),
// // //     );
// // //   }
// // // }

// // // class MyStatefulWidget extends StatefulWidget {
// // //   const MyStatefulWidget({Key? key}) : super(key: key);

// // //   @override
// // //   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// // // }

// // // class _MyStatefulWidgetState extends State<MyStatefulWidget> {
// // //   bool _pinned = true;
// // //   bool _snap = false;
// // //   bool _floating = false;

// // // // [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// // // // turn can be placed in a [Scaffold.body].
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: CustomScrollView(
// // //         slivers: <Widget>[
// // //           SliverAppBar(
// // //             pinned: _pinned,
// // //             snap: _snap,
// // //             floating: _floating,
// // //             expandedHeight: 160.0,
// // //             flexibleSpace: const FlexibleSpaceBar(
// // //               title: Text('SliverAppBar'),
// // //               background: FlutterLogo(),
// // //             ),
// // //           ),
// // //           const SliverToBoxAdapter(
// // //             child: SizedBox(
// // //               height: 20,
// // //               child: Center(
// // //                 child: Text('Scroll to see the SliverAppBar in effect.'),
// // //               ),
// // //             ),
// // //           ),
// // //           SliverList(
// // //             delegate: SliverChildBuilderDelegate(
// // //               (BuildContext context, int index) {
// // //                 return Container(
// // //                   color: index.isOdd ? Colors.white : Colors.black12,
// // //                   height: 100.0,
// // //                   child: Center(
// // //                     child: Text('$index', textScaleFactor: 5),
// // //                   ),
// // //                 );
// // //               },
// // //               childCount: 20,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //       bottomNavigationBar: BottomAppBar(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(8),
// // //           child: OverflowBar(
// // //             overflowAlignment: OverflowBarAlignment.center,
// // //             children: <Widget>[
// // //               Row(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: <Widget>[
// // //                   const Text('pinned'),
// // //                   Switch(
// // //                     onChanged: (bool val) {
// // //                       setState(() {
// // //                         _pinned = val;
// // //                       });
// // //                     },
// // //                     value: _pinned,
// // //                   ),
// // //                 ],
// // //               ),
// // //               Row(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: <Widget>[
// // //                   const Text('snap'),
// // //                   Switch(
// // //                     onChanged: (bool val) {
// // //                       setState(() {
// // //                         _snap = val;
// // //                         // Snapping only applies when the app bar is floating.
// // //                         _floating = _floating || _snap;
// // //                       });
// // //                     },
// // //                     value: _snap,
// // //                   ),
// // //                 ],
// // //               ),
// // //               Row(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: <Widget>[
// // //                   const Text('floating'),
// // //                   Switch(
// // //                     onChanged: (bool val) {
// // //                       setState(() {
// // //                         _floating = val;
// // //                         _snap = _snap && _floating;
// // //                       });
// // //                     },
// // //                     value: _floating,
// // //                   ),
// // //                 ],
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
