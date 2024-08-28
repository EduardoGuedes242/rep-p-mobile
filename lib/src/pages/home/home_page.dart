// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:rep_p_mobile/src/common/dados.dart';
import 'package:rep_p_mobile/src/repositories/marcacao.dart';
import 'package:rep_p_mobile/src/ui/cores.dart';
import 'package:rep_p_mobile/src/ui/fonts.dart';
import 'package:rep_p_mobile/src/ui/widgets/button.dart';
import 'package:rep_p_mobile/src/ui/widgets/digital_clock.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:svg_flutter/svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletaCores.backgroundWhite,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.lock_clock),
            title: Text("Relogio"),
            selectedColor: PaletaCores.backgroundBlue,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: PaletaCores.backgroundBlue,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: PaletaCores.backgroundBlue,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: PaletaCores.backgroundBlue,
          ),
        ],
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper2(),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: PaletaCores.backgroundBlue,
              ),
              child: Column(
                children: [
                  Container(
                    height: 10,
                  ),
                  AnalogClockInforvix(),
                  SizedBox(height: 5),
                  ButtonSecundaryInforvix(
                    titulo: 'Registrar Marcação',
                    funcao: () async {
                      await MarcacaoRepository().registrarMarcacao();

                      if (DadosGlobais.marcacaoRegistrada) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            message: "Marcação registrada com sucesso",
                          ),
                        );
                        DadosGlobais.marcacaoRegistrada = false;
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: "Ocorreu um erro ao registrar marcação",
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height - 360,
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
              color: PaletaCores.backgroundWhite,
              //color: Colors.red,
            ),
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(15),
                  child: Container(
                    margin: EdgeInsets.all(0),
                    height: 78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            Text(
                              '07:45',
                              style: Fonts.textStyleTituloHoras,
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                BagdeDyaOfWeek(day: 'Segunda Feira'),
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          'assets/icons/icon-ok.svg',
                          height: 38,
                          width: 38,
                        ),
                        SizedBox(width: 10)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BagdeDyaOfWeek extends StatelessWidget {
  const BagdeDyaOfWeek({
    required this.day,
    super.key,
  });
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      height: 25,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: PaletaCores.backgroundBlue,
      ),
      child: Center(
        child: Text(
          day,
          style: Fonts.textStyleTituloEdit
              .copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

class OvalBottomBorderClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RelogioPonteiros extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    // Calcular ângulos dos ponteiros (exemplo simplificado)
    final hora = DateTime.now().hour % 12;
    final minuto = DateTime.now().minute;
    final anguloHora = (hora + minuto / 60) * 30 * pi / 180;
    final anguloMinuto = minuto * 6 * pi / 180;

    // Desenhar ponteiro da hora
    canvas.drawLine(
      center,
      Offset(center.dx + radius * 0.5 * cos(anguloHora),
          center.dy + radius * 0.5 * sin(anguloHora)),
      paint,
    );

    // Desenhar ponteiro do minuto
    canvas.drawLine(
      center,
      Offset(center.dx + radius * 0.8 * cos(anguloMinuto),
          center.dy + radius * 0.8 * sin(anguloMinuto)),
      paint,
    );
  }

  @override
  bool shouldRepaint(RelogioPonteiros oldDelegate) =>
      true; // Redesenhar a cada atualização
}
