import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class CustomDialogAddEvent extends GetView<HomeController> {
  const CustomDialogAddEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nuevo Evento'),
      content: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
                onChanged: (value) {
                  controller.title.text = value;
                },
                validator: controller.validarTitulo,
                // onSaved: (value){
                //   controller.title.text = value!;
                // },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
                onChanged: (value) {
                  controller.description.text = value;
                },
                validator: controller.validarDescripcion,
                // onSaved: (value){
                //   controller.description.text = value!;
                // },
              ),
              Obx(() {
                controller.date.value = controller.selectedDay.value;
                  return Column(
                    children: [
                      ListTile(
                        title: const Text('Fecha'),
                        subtitle: Text(
                            '${controller.date.value.day}/${controller.date.value.month}/${controller.date.value.year}'),
                        onTap: () {
                          controller.selectDate(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Hora'),
                        subtitle: Text(controller.time.value.format(context)),
                        onTap: () {
                          controller.selectTime(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Color'),
                        subtitle: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.color.value,
                          ),
                        ),
                        onTap: () {
                          controller.pickColor(context);
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Recordatorio'),
                        value: controller.reminder.value,
                        onChanged: (value) {
                          controller.reminder.value = value;
                        },
                      ),
                    ],
                  );
                }
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.reset();
            Get.back();
          },
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () async {
            if (controller.formKey.currentState!.validate()) {
              controller.formKey.currentState!.save();
              try {
                controller.guardarEvento();
                Get.back();
                controller.reset();
              } catch(e){
                if (kDebugMode) {
                  print(e);
                }
              }
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}