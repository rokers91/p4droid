import 'package:flutter/material.dart';
import 'package:p4droid/src/extensions/screen_utils_context_extension.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de P4Droid'),
        toolbarHeight: context.appBarHeight,
        iconTheme: IconThemeData(size: context.appBarIconSize),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.setWidth(35)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'P4Droid',
                style: TextStyle(
                  fontSize: context.setSp(26),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.setHeight(16)),
              Text(
                'Descripción:',
                style: TextStyle(
                  fontSize: context.setSp(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'P4Droid es una aplicación que brinda información acerca del horario docente en la Universidad de Oriente en Cuba. Permite mostrar los turnos de clase en un calendario con su descripción, así como la hora en la que tocan esos turnos. También puede enviar notificaciones para recordar a los usuarios sobre sus próximas clases. Para los profesores, es una herramienta útil para llevar un registro de asistencia y realizar evaluaciones, así como para mostrar un resumen del grupo en cuanto a estos datos.',
                style: TextStyle(fontSize: context.setSp(16)),),
              SizedBox(height: context.setHeight(16)),
              Text(
                'Funciones:',
                style: TextStyle(
                  fontSize: context.setSp(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- Mostrar los turnos de clase en un calendario con su descripción\n- Mostrar la hora en la que tocan esos turnos\n- Notificar a los usuarios sobre sus próximas clases\n- Permitir a los profesores llevar un registro de asistencia y realizar evaluaciones\n- Mostrar un resumen del grupo en cuanto a estos datos',
                style: TextStyle(fontSize: context.setSp(16)),),
            ],
          ),
        ),
      ),
    );
  }
}
