import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:iMyPet/app/pages/pet/pet_bloc.dart';
import 'package:iMyPet/app/pages/pet/pet_edit_page.dart';
import 'package:iMyPet/models/pet_model.dart';

class PetPage extends StatefulWidget {
  final String title;

  static const String rota = '/pet_list';

  const PetPage({Key key, this.title = "Pet"}) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  var _bloc = PetBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var pet = Pet()
            ..especie = ""
            ..nome = ""
            ..cor = ""
            ..peso = 0.0
            ..dataNascimento = DateTime.now() 
            ..sexo = ""
            ..pelagem = ""
            ..observacao = "";

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PetEditPage(pet),
            ),
          );
        },
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: StreamBuilder<List<Pet>>(
          stream: _bloc.pet,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((pet) {
                  return Dismissible(
                    key: Key(pet.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(pet.documentId());
                    },
                    child: ListTile(
                      title: Text(pet.especie),
                      subtitle: Text(pet.nome),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetEditPage(pet),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
