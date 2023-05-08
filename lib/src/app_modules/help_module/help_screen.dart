import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget_globals/custom_help_widget.dart';
// import 'package:url_launcher/url_launcher.dart';


class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda y contacto'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.w),
        child: ListView(
          children: const [
            HelpContactListTile(
              title: 'Universidad de Oriente',
              subtitle: 'Av. Américas S/N, Santiago de Cuba. Cuba',
              icon: Icons.school,
            ),
            Divider(),
            HelpContactListTile(
              title: 'Correo electrónico',
              subtitle: 'p4droid@uo.edu.cu',
              icon: Icons.email,
            ),
            Divider(),
            HelpContactListTile(
              title: 'Teléfono',
              subtitle: '+58 123 456 7890',
              icon: Icons.phone,
            ),
          ],
        ),
      ),
    );
  }
}
