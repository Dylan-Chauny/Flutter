import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'serializer/meteo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluteo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutteo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Meteo> _getMeteo() async {
    print("DEB");
    /* ONLINE */
    var data = await http.get("https://www.prevision-meteo.ch/services/json/limoges");
    var jsonData = json.decode(data.body);

    /* OFFLINE
    var data = await rootBundle.loadString('data/meteo.json');
    Map jsonData = jsonDecode(data);
    */
    print("MIL");
    var cij = jsonData["city_info"];
    CityInfo ci = CityInfo(cij["name"], cij["country"], cij["lagitude"], cij["longitude"], cij["elevation"], cij["sunrise"], cij["sunset"]);
    Meteo m = Meteo(ci);
    print("OK");
    return m;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getMeteo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return ListView(
                children: <Widget>[
                  Text(snapshot.data.cityInfo.name.toString()),
                  Text(snapshot.data.cityInfo.country.toString()),
                  Text(snapshot.data.cityInfo.lagitude.toString()),
                  Text(snapshot.data.cityInfo.longitude.toString()),
                  Text(snapshot.data.cityInfo.elevation.toString()),
                  Text(snapshot.data.cityInfo.sunrise.toString()),
                  Text(snapshot.data.cityInfo.sunset.toString()),
                  Text(snapshot.data.cityInfo.toString())
                ],
              );
            }
          },
        ),
        ),
      );
  }
}
