import 'package:flutter/material.dart';

import '../../../../component/Personalizados.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _minhabarra('Minha conta', context),
    );
  }
}

voltaTela(BuildContext context) => Navigator.pop(context);

PreferredSizeWidget _minhabarra(String texto, context) {
  return MinhaAppBar(
    title:
        Text(texto, style: const TextStyle(color: Colors.white, fontSize: 36)),
    elevation: 10,
  );
}