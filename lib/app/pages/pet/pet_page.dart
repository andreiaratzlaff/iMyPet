import 'package:flutter/material.dart';
import 'package:imypet/app/pages/pet/pet_bloc.dart';
import 'package:imypet/models/pet_model.dart';

class PetPage extends StatefulWidget {
  final Pet pet;
  PetPage(this.pet);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  var bloc = PetBloc();

  @override
  Widget build(BuildContext context) {
    var _bloc = PetBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("iMyPet - Pet"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var pet = Pet()
            ..cadastro = ""
            ..cor = ""
            ..especie = ""
            ..nome = ""
            ..observacao = ""
            ..pelagem = ""
            ..peso = 5.2
            ..raca = ""
            ..sexo = ""
            ..proprietario_id = ""
            ..dataNascimento = DateTime.now();
        },
      ),
      body: Container(
        child: StreamBuilder<List<Pet>>(
            stream: _bloc.pet,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              return Container(
                  child: ListView(
                      children: snapshot.data.map((pet) {
                return ListTile(
                  title: Text(pet.cadastro),
                  subtitle: Text(pet.cor),
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              }).toList()));
            }),
      ),
    );
  }
}
