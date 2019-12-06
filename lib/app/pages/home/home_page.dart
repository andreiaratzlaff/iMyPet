import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  final String title;
  static const String rota = '/home';

  const HomePage({Key key, this.title = "Home"}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return FlatButton(
                child: const Text('Logoff'),
                textColor: Theme.of(context).buttonColor,
                onPressed: () async {
                  final FirebaseUser user = await _auth.currentUser();
                  if (user == null) {
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Ninguém esta logado!"),
                      ),
                    );
                    return;
                  }
                  _signOut();
                }
              );
            },
          ),
        ],
      ),
      body: Column(
          children: <Widget>[
            CarouselSlider(
            height: 400.0,
            items: [
              'https://cdn.pixabay.com/photo/2015/07/31/11/43/bordeaux-869006_960_720.jpg',
              'https://cdn.pixabay.com/photo/2019/09/14/23/14/dogs-4477058_960_720.jpg',
              'https://cdn.pixabay.com/photo/2017/09/25/13/14/dog-2785077_960_720.jpg',
              'https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_960_720.jpg'
              ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber
                    ),
                    child: Image.network(i, fit: BoxFit.fill)
                  );
                },
              );
            }).toList(),
          )
        ],
      ),

      
    );
  }

  void _signOut() async {
    await _auth.signOut();
  }
}
