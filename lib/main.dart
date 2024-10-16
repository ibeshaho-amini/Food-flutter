// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// var bannerItems = ["Burger", "Cheese", "Bread", "Pizza"];
// var bannerImages = [
//   "images/burger3.jpg",
//   "images/pizza1.jpg",
//   "images/bread1.jpg",
//   "images/pizza3.jpg"
// ];
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//
//     Future<List<Widget>> createList() async {
//       List<Widget> items = [];
//       String dataString = await DefaultAssetBundle.of(context).loadString("assets/data.json");
//       List<dynamic> dataJSON = jsonDecode(dataString);
//
//
//       dataJSON.forEach((object) {
//
//         String finalString = "";
//         List<dynamic> datalist = object["placeItems"];
//
//         datalist.forEach((item){
//           finalString = finalString + item + " ";
//         });
//
//
//         items.add(Padding(padding: EdgeInsets.all(2.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   spreadRadius: 2.0,
//                   blurRadius: 5.0,
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
//                   child: Image.asset(object["placeImage"], width: 80, height: 80, fit: BoxFit.cover),
//                 ),
//                 Padding(padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(object["placeName"]),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 2.0,bottom: 2.0),
//                         child: Text(finalString,style: TextStyle(fontSize: 12.0,color: Colors.black54),maxLines: 1,),
//                       ),
//                       Text("Min. Oder: ${object["miniOrder"]}",style: TextStyle(fontSize: 12.0,color: Colors.black54),),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//       });
//       return items;
//     }
//
//     return Scaffold(
//       body: Container(
//         height: screenHeight,
//         width: screenWidth,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
//                       const Text(
//                         "Foodies",
//                         style: TextStyle(fontSize: 50, fontFamily: "LeagueSpartan-Regular"),
//                       ),
//                       IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
//                     ],
//                   ),
//                 ),
//                 BannerWidgetArea(),
//                 Container(
//                   child: FutureBuilder(
//                     initialData: <Widget>[Text("")],
//                     future: createList(),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: ListView(
//                             primary: false,
//                             shrinkWrap: true,
//                             children: snapshot.data,
//                          ),
//                         );
//                       } else {
//                         return CircularProgressIndicator();
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BannerWidgetArea extends StatelessWidget {
//   const BannerWidgetArea({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//
//     PageController controller = PageController(viewportFraction: 0.8, initialPage: 0);
//
//     List<Widget> banners = [];
//
//     for (int x = 0; x < bannerItems.length; x++) {
//       var bannerView = Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Container(
//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black54,
//                       offset: Offset(2.0, 2.0),
//                       blurRadius: 5.0,
//                       spreadRadius: 1.0,
//                     ),
//                   ],
//                 ),
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 child: Image.asset(bannerImages[x], fit: BoxFit.cover),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [Colors.transparent, Colors.black],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(bannerItems[x], style: TextStyle(fontSize: 25.0, color: Colors.white)),
//                     Text("More than 40% Off", style: TextStyle(fontSize: 12.0, color: Colors.white)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//       banners.add(bannerView);
//     }
//
//     return Container(
//       height: screenWidth * 9 / 16,
//       width: screenWidth,
//       child: PageView(
//         controller: controller,
//         scrollDirection: Axis.horizontal,
//         children: banners,
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

var bannerItems = ["Burger", "Cheese", "Bread", "Pizza"];
var bannerImages = [
  "images/burger3.jpg",
  "images/pizza2.jpg",
  "images/bread3.jpg",
  "images/pizza1.jpg"
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = [];
      String dataString = await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {
        String finalString = "";
        List<dynamic> datalist = object["placeItems"];

        datalist.forEach((item){
          finalString = finalString + item + " ";
        });

        items.add(Padding(padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2.0,
                  blurRadius: 5.0,
                ),
              ],
            ),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(object["placeImage"], width: 80, height: 80, fit: BoxFit.cover),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(object["placeName"]),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0,bottom: 2.0),
                          child: Text(finalString,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.0,color: Colors.black54),maxLines: 1,),
                        ),
                        Text("Min. Oder: ${object["miniOrder"]}",style: TextStyle(fontSize: 12.0,color: Colors.black54),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      });
      return items;
    }

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
                      const Text(
                        "Foodies",
                        style: TextStyle(fontSize: 50, fontFamily: "LeagueSpartan-Regular"),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
                    ],
                  ),
                ),
                BannerWidgetArea(),
                Container(
                  child: FutureBuilder<List<Widget>>(
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data!,
                          ),
                        );
                      } else {
                        return Text("No data available");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Colors.black,
      child: Icon(MdiIcons.food, color: Colors.white,),),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  const BannerWidgetArea({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller = PageController(viewportFraction: 0.8, initialPage: 0);

    List<Widget> banners = [];

    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(bannerImages[x], fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(bannerItems[x], style: TextStyle(fontSize: 25.0, color: Colors.white)),
                    Text("More than 40% Off", style: TextStyle(fontSize: 12.0, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      height: screenWidth * 9 / 16,
      width: screenWidth,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}