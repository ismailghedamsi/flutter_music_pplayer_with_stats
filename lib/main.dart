import 'package:flutter/material.dart';
import './artistpage.dart' as artistPage;
import './trackspage.dart' as trackspage;
import './albumspage.dart' as albumspage;
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
         title:  new Text('Tbs app'),
         backgroundColor: Colors.teal,
         bottom:  new TabBar(
            controller: controller,
             tabs: <Widget>[
               new Tab(text: "TRACKS",),
               new Tab(text: "ARTISTS",),
               new Tab(text: "ALBUMS" ,)
             ]
         ),
       ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new trackspage.Tracks(),
          new artistPage.ArtistPage(),
          new albumspage.AlbumsPage()
        ]
        ),
    );
  }

}