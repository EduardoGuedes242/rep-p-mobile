// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rep_p_mobile/src/ui/cores.dart';
import 'package:rep_p_mobile/src/ui/fonts.dart';

class EditInforvix extends StatelessWidget {
  const EditInforvix({
    super.key,
    required this.controller,
    required this.titulo,
    required this.hint,
  });

  final TextEditingController controller;
  final String titulo;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      width: MediaQuery.sizeOf(context).width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: Fonts.textStyleTituloEdit,
          ),
          Spacer(),
          Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: PaletaCores.backgroundWhiteSolid,
              border: Border.all(
                width: 1,
                color: PaletaCores.cinza,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
