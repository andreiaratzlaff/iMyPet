// TODO Implement this library.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/meusdados/meusdados_bloc.dart';
import 'package:iMyPet/models/meusdados_model.dart';

class MeusdadosEditPage extends StatefulWidget {
  MeusdadosEditPage(this.meusdados);

  final Meusdados meusdados;

  @override
  _MeusdadosEditPageState createState() => _MeusdadosEditPageState();
}

class _MeusdadosEditPageState extends State<MeusdadosEditPage> {
  TextEditingController _nomeController;
  TextEditingController _cpfController;
  TextEditingController _emailController;
  TextEditingController _generoController;
  TextEditingController _dddCelularController;
  TextEditingController _dddTelefoneController;
  TextEditingController _cepController;
  TextEditingController _enderecoController;
  TextEditingController _estadoController;
  TextEditingController _cidadeController;
  TextEditingController _userIdController;

  final _bloc = MeusdadosBloc();

  @override
  void initState() {
    _bloc.setMeusdados(widget.meusdados);
    _nomeController = TextEditingController(text: widget.meusdados.nome);
    _cpfController = TextEditingController(text: widget.meusdados.cpf);
    _emailController = TextEditingController(text: widget.meusdados.email);
    _generoController = TextEditingController(text: widget.meusdados.genero);
    _dddCelularController =
        TextEditingController(text: widget.meusdados.dddCelular);
    _dddTelefoneController =
        TextEditingController(text: widget.meusdados.dddTelefone);
    _cepController = TextEditingController(text: widget.meusdados.cep);
    _enderecoController =
        TextEditingController(text: widget.meusdados.endereco);
    _estadoController = TextEditingController(text: widget.meusdados.estado);
    _cidadeController = TextEditingController(text: widget.meusdados.cidade);
    _userIdController = TextEditingController(text: widget.meusdados.userId);

    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _emailController.dispose();
    _generoController.dispose();
    _dddCelularController.dispose();
    _dddTelefoneController.dispose();
    _cepController.dispose();
    _enderecoController.dispose();
    _estadoController.dispose();
    _cidadeController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iMyPet"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "CPF"),
                  controller: _cpfController,
                  onChanged: _bloc.setCpf,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Email"),
                  controller: _emailController,
                  onChanged: _bloc.setEmail,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Gênero"),
                  controller: _generoController,
                  onChanged: _bloc.setGenero,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Celular com DDD"),
                  controller: _dddCelularController,
                  onChanged: _bloc.setDDDCelular,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Telefone com DDD"),
                  controller: _dddTelefoneController,
                  onChanged: _bloc.setDDDTelefone,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "CEP"),
                  controller: _cepController,
                  onChanged: _bloc.setCep,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Endereço"),
                  controller: _enderecoController,
                  onChanged: _bloc.setEndereco,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Estado"),
                  controller: _estadoController,
                  onChanged: _bloc.setEstado,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Cidade"),
                  controller: _cidadeController,
                  onChanged: _bloc.setCidade,
                ),
              ),
              RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    FirebaseAuth.instance.currentUser().then((user) {
                      if (_bloc.insertOrUpdate(user.uid.toString())) {
                        Navigator.pop(context);
                      }

                      //_bloc.setUserId(user.uid);
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
