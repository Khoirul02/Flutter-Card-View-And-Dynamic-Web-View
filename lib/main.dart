// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(MaterialApp(
    title: "Laporan",
    home : Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> listMenu = [];
  var lap=[
    {"menu": "Laporan Harian", "gambar": "day.png", "link": "https://cv-khoirulhuda.firebaseapp.com/"},
    {"menu": "Laporan Bulanan", "gambar": "month.png", "link": "https://www.linkedin.com/in/khoirul-huda-595a05185/"},
    {"menu": "Laporan Pengguna", "gambar": "user.png", "link": "https://github.com/Khoirul02/"},
  ];

  _buatlist()async {
    for(var i = 0; i < lap.length; i++){
        final lapnya = lap[i];
        final String gambar = lapnya["gambar"].toString();
        listMenu.add(
            Container(
              padding: EdgeInsets.all(5.0),
              child: Card( child :
                Column(
                  children: <Widget>[
                    Hero(
                      tag: lapnya['menu'].toString(),
                      child: Material(
                        child: InkWell(
                          onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context)=> Detail(menu: lapnya['menu'].toString(), link: lapnya['link'].toString(),),
                          )),
                          child: Image.asset("img/$gambar", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    Text(lapnya['menu'].toString(), style : const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), )
                  ],
                )
              ),
            )
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Laporan", style: TextStyle(color: Colors.white),),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children : listMenu,
      ),
    );
  }
  @override
  void initState() {
    _buatlist();
    super.initState();
  }
}
class Detail extends StatelessWidget {
  Detail({required this.menu, required this.link});
  final String menu;
  final String link;

  get temp => link;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: WebView(
            initialUrl: temp, // dynamic url copy from deep link var it will not load in web view
            javascriptMode: JavascriptMode.unrestricted,
          ),
        );
      }),
    );
  }
}