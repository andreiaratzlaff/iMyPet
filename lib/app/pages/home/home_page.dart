import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "iMyPet Pedidos",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 25.0,
                            ),
                          )
                        ),
                        Container(
                          height: 150.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, position){
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200.0,
                                  height: 150.0,
                                  child: Image.network("https://s3-sa-east-1.amazonaws.com/projetos-artes/fullsize%2F2013%2F03%2F12%2F14%2FWDL-Logo-23813_20324_052757579_1431116414.jpg"),
                                ),
                              );
                              },
                          ),
                          ),
        
                    DefaultTabController(
                      length: 3,
                      child: Expanded(
                            child: Column(
                          children: <Widget>[
                    TabBar(
                     unselectedLabelColor: Colors.black,
                     indicatorColor: Colors.blue,
                        tabs: [
                        Tab(
                          text: "Banho & Tosa",
                        ),
                        Tab(
                          text: "Hotel",
                        ),
                        Tab(
                          text: "Dog Walker",)
                        ,
                    ],
                    ),
                    
                    Expanded(
                          child: TabBarView(
                            children: [
                              GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                                itemCount: 2,
                                itemBuilder: (context, position){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 200.0,
                                      height: 150.0,
                                      color: Colors.purple,
                                      child: Image.network("https://i.pinimg.com/originals/6b/41/cc/6b41cc9318fa347aa1b0abad91550e76.jpg"),
                                      
                                    ),
                                  );
                                },
                              ),  
                          GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                                itemCount: 4,
                                itemBuilder: (context, position){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 200.0,
                                      height: 150.0,
                                      color: Colors.yellow,
                                      child: Image.network("https://dam.ngenespanol.com/wp-content/uploads/2019/01/hotel-perro.png"),
                                    ),
                                  );
                                },
                              ),
                          GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                                itemCount: 6,
                                itemBuilder: (context, position){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 200.0,
                                      height: 150.0,
                                      color: Colors.red,
                                      child: Image.network("http://dogwalkeremsaopaulo.com.br/img/logo-dog-walker-sem-site.png"),
                                    ),
                                  );
                                },
                              ),
                        ],),
                    ),
                    ],
                    ),
                      ),
                   ),
            ],
          ),
    );
  }
  void _signOut() async {
    await _auth.signOut();
  }
}
