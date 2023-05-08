import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid/src/app_modules/calendar_module/calendar_widget.dart';
import 'package:p4droid/src/app_modules/home_module/widgets/custom_drawer_widget.dart';

import '../../widget_globals/custom_appbar_global_widget.dart';
import 'widgets/custom_add_event_dialog_widget.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyCustomAppBar(title: 'P4Droid'),
        body:  Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : const CalendarWidget()),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
           await showDialog(
              context: context,
              builder: (context) => const CustomDialogAddEvent(),
            );
           // if(result){
           //   Future.delayed(const Duration(seconds: 3));
           //   controller.isLoading.value = false;
           // } else {
           //   //gestion del estado de la inserccion de los eventos
           //   // controller.processResultAddEvent(result);
           // }
          },
          child: const Icon(Icons.add),
        ),
        drawer: CustomDrawer());
  }
}
