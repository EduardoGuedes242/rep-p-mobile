// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:rep_p_mobile/src/ui/cores.dart';
import 'package:rep_p_mobile/src/ui/fonts.dart';

class SolicitarInclusaoMarcacao extends StatefulWidget {
  const SolicitarInclusaoMarcacao({super.key});

  @override
  State<SolicitarInclusaoMarcacao> createState() =>
      _SolicitarInclusaoMarcacaoState();
}

class _SolicitarInclusaoMarcacaoState extends State<SolicitarInclusaoMarcacao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Image.asset(
                'assets/images/manutencao.png',
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Desculpe pelo transtorno...',
              style: Fonts.textStyleTituloEdit
                  .copyWith(color: PaletaCores.backgroundBlue),
            ),
            SizedBox(height: 5),
            Text(
              'Em breve iremos trazer melhorias...',
              style: Fonts.textStyleTituloEdit.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
