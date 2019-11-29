import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_bloc.dart';
import 'package:iMyPet/models/banhoETosa_model.dart';
import 'package:intl/intl.dart';

class BanhoETosaEditPage extends StatefulWidget {
  BanhoETosaEditPage(this.banhoETosa);

  final BanhoETosa banhoETosa;

  @override
  _BanhoETosaEditPageState createState() => _BanhoETosaEditPageState();
}

class _BanhoETosaEditPageState extends State<BanhoETosaEditPage> {
  final _bloc = BanhoETosaBloc();
  final _blocBanhoETosa = BanhoETosaBloc();
  BanhoETosa _banhoETosa = new BanhoETosa();
  final _dateFormat = DateFormat("dd/MM/yyyy");

  TextEditingController _codigoPetController;
  TextEditingController _codigoEmpresaPetshopController;
  TextEditingController _agendarDataHorarioController;
  TextEditingController _selecioneTipoServicoController;
  TextEditingController _tosaController;
  TextEditingController _informeTipoTosaController;
  TextEditingController _hidratacaoPeloController;
  TextEditingController _tipoHidratacaoController;
  TextEditingController _aplicarVermifugoController;
  TextEditingController _tipoVermifugoController;
  TextEditingController _aplicarRemedioPulgasController;
  TextEditingController _tipoRemedioPulgaController;
  TextEditingController _informeLocalDeBuscaeEntregaController;
  TextEditingController _observacaoController;
  TextEditingController _valorController;

  @override
  void initState() {
    _bloc.setBanhoETosa(widget.banhoETosa);

    _codigoPetController =
        TextEditingController(text: widget.banhoETosa.codigoPet);
    _codigoEmpresaPetshopController =
        TextEditingController(text: widget.banhoETosa.codigoEmpresaPetshop);

    _selecioneTipoServicoController =
        TextEditingController(text: widget.banhoETosa.selecioneTipoServico);

       _informeTipoTosaController =
        TextEditingController(text: widget.banhoETosa.informeTipoTosa);

    _tipoHidratacaoController =
        TextEditingController(text: widget.banhoETosa.tipoHidratacao);

    _tipoRemedioPulgaController =
        TextEditingController(text: widget.banhoETosa.tipoRemedioPulga);

    _observacaoController =
        TextEditingController(text: widget.banhoETosa.observacao);

    //_valorController =
    //    TextEditingController(text: widget.banhoETosa.valor);

    super.initState();
  }

  @override
  void dispose() {
    _codigoPetController.dispose();
    _codigoEmpresaPetshopController.dispose();
    _agendarDataHorarioController.dispose();
    _selecioneTipoServicoController.dispose();
    _tosaController.dispose();
    _informeTipoTosaController.dispose();
    _hidratacaoPeloController.dispose();
    _tipoHidratacaoController.dispose();
    _aplicarVermifugoController.dispose();
    _tipoVermifugoController.dispose();
    _aplicarRemedioPulgasController.dispose();
    _tipoRemedioPulgaController.dispose();
    _informeLocalDeBuscaeEntregaController.dispose();
    _observacaoController.dispose();
    _valorController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banho & Tosa"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Codigo Empresa"),
                  controller: _codigoEmpresaPetshopController,
                  onChanged: _bloc.setCodigoEmpresaPetshop,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Codigo Pet"),
                  controller: _codigoPetController,
                  onChanged: _bloc.setCodigoPet,
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
