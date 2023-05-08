import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:p4droid/src/constants/app_colors_pallette.dart';
import 'package:p4droid/src/extensions/screen_utils_context_extension.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/event_model.dart';
import '../home_module/home_controller.dart';
import '../home_module/widgets/custom_add_event_dialog_widget.dart';


class CalendarWidget extends GetView<HomeController> {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCalendar(),
        Expanded(child: _buildEventList()),
      ],
    );
  }

  Widget _buildEventList() {
    return Obx(() {
      final eventsForDay =
      controller.getEventsForDay(controller.selectedDay.value);

      return ListView.builder(
        itemCount: eventsForDay.length,
        itemBuilder: (context, index) {
          Event event = eventsForDay[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.setWidth(16),
              vertical: context.setHeight(8),
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: event.color,
              child: Padding(
                padding: EdgeInsets.all(context.setSp(8)),
                child: ListTile(
                  title: Text(
                    event.title,
                    style: TextStyle(
                      fontSize: context.setSp(16),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.description,
                        style: TextStyle(
                          fontSize: context.setSp(14),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Text(
                      //   'Fecha: ${DateFormat.yMMMd(Intl.systemLocale).format(
                      //       event.date)}',
                      //   style: TextStyle(
                      //     fontSize: context.setSp(14),
                      //   ),
                      // ),
                      Text(
                        'Hora: ${event.time.format(context)}',
                        style: TextStyle(
                          fontSize: context.setSp(14),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    event.reminder ? Icons.alarm : Icons.alarm_off,
                    size: context.setWidth(24),
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Acción que se debe realizar cuando se presiona la tarjeta del evento.
                    controller.showDetalisEventoDialog(event);
                  },
                  onLongPress: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Información'),
                          content: const Text('¿Qué operación desea realizar?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Acción para eliminar
                                controller.showEliminarEventoDialog(context, event);
                              },
                              child: const Text('Eliminar'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Acción para actualizar
                                // Get.toNamed('/edit', arguments: event);
                                controller.showEditarEventoDialog(event);
                              },
                              child: const Text('Actualizar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildCalendar() {
    return Obx(() {
      var selectedDay = controller.selectedDay.value;

      return TableCalendar(
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
        focusedDay: selectedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        calendarFormat: controller.calendarFormat.value,
        onFormatChanged: (format) {
          controller.calendarFormat.value = format;
        },
        onDaySelected: (selectedDay, focusedDay) {
          controller.selectedDay.value = selectedDay;
        },
        eventLoader: (day) => controller.getEventsForDay(day),
        onDayLongPressed: (selectedDay, focusedDay) async {
          var eventsForDay = controller.getEventsForDay(selectedDay);
          if (eventsForDay.isEmpty) {
            _showNoEventDialog(Get.context!);
          }
        },
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppPalette.primaryColor.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          markersAlignment: Alignment.bottomCenter,
          markerDecoration: const BoxDecoration(
            color: AppPalette.lightColor,
            shape: BoxShape.circle,
          ),
          markersMaxCount: 3,
          markersOffset: const PositionedOffset(top: 0, bottom: 20),
        ),
      );
    });
  }

  void _showNoEventDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('No hay eventos'),
              content: const Text(
                  'En el día seleccionado no hay eventos que mostrar.'),
              actions: [
                TextButton(
                  onPressed: () async {
                    //mostrar dialog add event
                    await showDialog(
                      context: context,
                      builder: (context) => const CustomDialogAddEvent(),
                    );
                    Get.back();
                  },
                  child: const Text(
                    'Crear Nuevo Evento',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Get.back();
                  },
                  child: const Text('Atrás'),
                ),
              ]);
        });
  }


// Definición del método para mostrar el diálogo del evento seleccionado.
//   void _showEventDetailsDialog(BuildContext context, Event event) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//             builder: (context, setState) {
//               return AlertDialog(
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       event.title,
//                       style: TextStyle(
//                         fontSize: context.setSp(20),
//                         fontWeight: FontWeight.bold,
//                         color: event.color,
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.edit,
//                         color: event.color,
//                         size: context.setWidth(24),
//                       ),
//                       onPressed: () {
//                         // Lógica para editar el evento
//                       },
//                     ),
//                   ],
//                 ),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Descripción:',
//                       style: TextStyle(
//                         fontSize: context.setSp(16),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       event.description,
//                       style: TextStyle(
//                         fontSize: context.setSp(14),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       'Fecha:',
//                       style: TextStyle(
//                         fontSize: context.setSp(16),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       DateFormat.yMMMMd().format(event.date),
//                       style: TextStyle(
//                         fontSize: context.setSp(14),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       'Hora:',
//                       style: TextStyle(
//                         fontSize: context.setSp(16),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       event.time.format(context),
//                       style: TextStyle(
//                         fontSize: context.setSp(14),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       children: [
//                         Icon(
//                           event.reminder ? Icons.alarm : Icons.alarm_off,
//                           size: context.setWidth(24),
//                           color: event.reminder ? Colors.blue : Colors.grey,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           event.reminder
//                               ? 'Tiene recordatorio'
//                               : 'No tiene recordatorio',
//                           style: TextStyle(
//                             fontSize: context.setSp(14),
//                             color: event.reminder ? Colors.blue : Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       textStyle: TextStyle(
//                         fontSize: context.setSp(16),
//                       ),
//                     ),
//                     child: const Text('Cerrar'),
//                   ),
//                 ],
//               );
//             }
//         );
//       },
//     );
//   }
}
