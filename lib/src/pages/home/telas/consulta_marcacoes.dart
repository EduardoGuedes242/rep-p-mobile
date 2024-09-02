// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rep_p_mobile/src/common/dados.dart';
import 'package:rep_p_mobile/src/model/marcacao.dart';
import 'package:rep_p_mobile/src/repositories/marcacao.dart';
import 'package:rep_p_mobile/src/ui/cores.dart';
import 'package:rep_p_mobile/src/ui/fonts.dart';
import 'package:rep_p_mobile/src/ui/widgets/button.dart';
import 'package:rep_p_mobile/src/ui/widgets/edit.dart';
import 'package:rep_p_mobile/src/ui/widgets/titulo_data.dart';
import 'package:svg_flutter/svg.dart';

class ConsultaMarcacoesTelas extends StatefulWidget {
  const ConsultaMarcacoesTelas({
    super.key,
  });

  @override
  State<ConsultaMarcacoesTelas> createState() => _ConsultaMarcacoesTelasState();
}

class _ConsultaMarcacoesTelasState extends State<ConsultaMarcacoesTelas> {
  TextEditingController dataInicio = TextEditingController();
  TextEditingController dataFim = TextEditingController();

  List<GetMarcacoesModel> marcacoes = [];

  Future<void> buscarMarcacoes() async {
    try {
      List<GetMarcacoesModel> resultado =
          await MarcacaoRepository().getMarcacoesPeriodo(dataInicio.text, dataFim.text, DadosGlobais.cpfLogin);

      setState(() {
        marcacoes = resultado;
      });
    } catch (e) {
      print('Erro ao buscar marcações: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: PaletaCores.backgroundWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Selecione o Periodo',
              style: Fonts.textStyleTituloHoras,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EditData(
                controller: dataInicio,
                titulo: 'Data Inicio',
              ),
              EditData(
                controller: dataFim,
                titulo: 'Data Fim',
              ),
            ],
          ),
          Center(
            child: ButtonPrimaryInforvix(
              titulo: 'Consultar Marcações',
              funcao: () {
                buscarMarcacoes();
              },
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: marcacoes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PaletaCores.backgroundWhiteSolid,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12),
                              Text(
                                marcacoes[index].hora.toString(),
                                style: Fonts.textStyleTituloHoras,
                              ),
                              SizedBox(height: 3),
                              BagdeDyaOfWeek(
                                day: marcacoes[index].data.toString(),
                              ),
                            ],
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/icons/comprovante.svg',
                            height: 38,
                            width: 38,
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
