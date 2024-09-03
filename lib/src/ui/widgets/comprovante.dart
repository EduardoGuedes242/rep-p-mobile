import 'package:flutter/material.dart';
import 'package:rep_p_mobile/src/ui/cores.dart';
import 'package:rep_p_mobile/src/ui/fonts.dart';
import 'package:rep_p_mobile/src/ui/widgets/titulo_data.dart';
import 'package:svg_flutter/svg.dart';

class ComprovanteWidget extends StatelessWidget {
  const ComprovanteWidget({
    super.key,
    required this.hora,
    required this.data,
  });

  final String hora;
  final String data;

  @override
  Widget build(BuildContext context) {
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
                    hora,
                    style: Fonts.textStyleTituloHoras,
                  ),
                  SizedBox(height: 3),
                  BagdeDyaOfWeek(day: data),
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
  }
}
