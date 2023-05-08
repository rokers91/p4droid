import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors_pallette.dart';
import '../../../models/drawer_model.dart';

class CustomDrawer extends StatelessWidget {
  final List<DrawerItem> items = [
    DrawerItem(title: 'Inicio', icon: Icons.home, routeName: '/home'),
    DrawerItem(title: 'Registrarse/Iniciar sesión', icon: Icons.login),
    DrawerItem(title: 'Cargar archivos', icon: Icons.file_upload),
    DrawerItem(title: 'Acerca de P4Droid', icon: Icons.info, routeName: '/info'),
    DrawerItem(title: 'Ayuda y contacto', icon: Icons.help),
    DrawerItem(title: 'Configuración', icon: Icons.settings, hasSubMenu: true, routeName: '/settings'),
    DrawerItem(title: 'Salir', icon: Icons.exit_to_app),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppPalette.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 80.0),
        child: Column(
          children: [
            // const DrawerHeader(
            //   child: Text('P4Droid Menú'),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(item.icon),
                        title: Text(item.title),
                        onTap: () {
                          if (item.hasSubMenu) {
                            // abre el submenú de configuración
                            Get.toNamed('/settings');
                          } else {
                            // cierra el drawer y realiza la acción correspondiente
                            switch (item.title) {
                              case 'Inicio':
                              // acción de inicio
                              //   Get.toNamed('/home');
                                Get.back();
                                break;
                              case 'Registrarse/Iniciar sesión':
                              // acción de registro o inicio de sesión
                                break;
                              case 'Cargar archivos':
                              // acción de carga de archivos de horario
                                break;
                              case 'Acerca de P4Droid':
                              // acción de información útil
                                Get.toNamed('/info');
                                break;
                              case 'Ayuda y contacto':
                              // acción de ayuda y contacto
                                Get.toNamed('/help');
                                break;
                              case 'Salir':
                                exit(0);
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 20,),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<DrawerItem> configSubMenuItems = [
    DrawerItem(title: 'Tema', icon: Icons.color_lens),
    DrawerItem(title: 'Ajuste de notificaciones', icon: Icons.notifications),
    DrawerItem(title: 'Ajuste de horario', icon: Icons.schedule),
  ];

  CustomDrawer({super.key});
}





// import 'package:flutter/material.dart';
//
// import '../app_modules/home_module/home_controller.dart';
//
// class DrawerView extends StatelessWidget {
//   final HomeController homeController;
//
//   const DrawerView({super.key, required this.homeController});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text('Mi aplicación'),
//           ),
//           ListTile(
//             leading: const Icon(Icons.file_upload_outlined),
//             title: const Text('Cargar archivo'),
//             selected: homeController.selectedIndex.value == 0,
//             onTap: () {
//               // homeController.selectItem(0);
//               // Navigator.pop(context);
//               // homeController.loadFile();
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Configuración'),
//             selected: homeController.selectedIndex.value == 1,
//             onTap: () {
//               homeController.selectItem(1);
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyMenu extends StatelessWidget {
//   final HomeController controller;
//
//   const MyMenu({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: controller.extensions
//           .map(
//             (extension) => RadioListTile(
//               title: Text(extension.name),
//               value: extension.value,
//               groupValue: controller.selectedExtension.value,
//               onChanged: (value) {
//                 controller.selectedExtension.value = value!;
//               },
//             ),
//           )
//           .toList(),
//     );
//   }
// }
