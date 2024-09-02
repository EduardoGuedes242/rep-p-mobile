// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';
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
class EditData extends StatelessWidget {
  const EditData({
    super.key,
    required this.controller,
    required this.titulo,
  });

  final TextEditingController controller;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 160,
      child: TextField(
        controller: controller,
        inputFormatters: [Mask.date()],
        decoration: InputDecoration(
          hintText: '17/08/2024',
          labelText: titulo,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: IconButton(
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (pickedDate != null) {
                String formattedDate = '${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}';
                controller.text = formattedDate;
              }
            },
            icon: Icon(Icons.date_range_outlined),
            color: PaletaCores.backgroundBlue,
          ),
        ),
      ),
    );
  }
}
