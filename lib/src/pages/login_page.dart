// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:rep_p_mobile/src/ui/cores.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PaletaCores.backgroundBlue,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 180),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 180,
                  decoration: BoxDecoration(
                    color: PaletaCores.backgroundWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Spacer(),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: PaletaCores.backgroundWhiteSolid,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/logo_inforvix.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: PaletaCores.backgroundBlue,
              width: double.infinity,
              height: 180,
              child: Center(
                child: Image.asset(
                  'assets/images/logo_pontovix.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
