import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/routes.dart';
import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_page.dart';
import 'package:iMyPet/app/pages/especie/especie_page.dart';
import 'package:iMyPet/app/pages/home/home_module.dart';
import 'package:iMyPet/app/pages/home/home_page.dart';
import 'package:iMyPet/app/pages/meusdados/meusdados_page.dart';
import 'package:iMyPet/app/pages/pet/pet_page.dart';
import 'package:iMyPet/app/pages/raca/raca_page.dart';
import 'package:iMyPet/app/pages/vacinas/vacinas_page.dart';
import 'pages/banhoETosa/banhoETosa_page.dart';
import 'pages/login/signin_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Rotas.home: (context) => HomePage(),
        Rotas.vacinas: (context) => VacinasPage(),
        Rotas.meusdados: (context) => MeusdadosPage(),
        Rotas.carteiraVacina: (context) => CarteiraVacinaPage(),
        Rotas.pet: (context) => PetPage(),
        Rotas.banhoETosa: (context) => BanhoETosaPage(),
        Rotas.especie: (context) => EspeciePage(),
        Rotas.raca: (context) => RacaPage(),
      },
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            FirebaseUser user = snapshot.data;
            if (user == null) {
              return SignInPage();
            }
            return HomeModule();
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
