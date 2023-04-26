import 'package:flutter/material.dart';
import 'package:stockcontrol/src/feature/home/view/widget/localization.dart';

import '../widget/account.dart';
import '../../../../component/Personalizados.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _qtd = 1;
  void _incrementaEstabelecimento() {
    setState(() {
      _qtd++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _minhabarra('Stock Control', context),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _qtd,
        itemBuilder: (BuildContext, int index) {
          return Linha();
        },
      ),
      floatingActionButton: MeuFloatingActionButton(
        incrementaEstabelecimento: _incrementaEstabelecimento,
      ),
    );
  }
}

//APP BAR
PreferredSizeWidget _minhabarra(String texto, context) {
  return MinhaAppBar(
    title:
        Text(texto, style: const TextStyle(color: Colors.white, fontSize: 36)),
    elevation: 10,
    actions: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.account_circle,
          size: 40,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserAccount()));
        },
      )
    ],
  );
}

//BOTOES DE MAPA E ADICIONAR
class MeuFloatingActionButton extends StatefulWidget {
  final VoidCallback incrementaEstabelecimento;

  MeuFloatingActionButton({Key? key, required this.incrementaEstabelecimento})
      : super(key: key);
  @override
  State<MeuFloatingActionButton> createState() =>
      _MeuFloatingActionButtonState();
}

class _MeuFloatingActionButtonState extends State<MeuFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 24),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserLocalization()),
              );
            },
            tooltip: 'Vai para a tela de localização',
            child: const Icon(Icons.map),
          ),
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: widget.incrementaEstabelecimento,
          tooltip: 'Vai para a tela "Cria Estabelecimento" ',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
