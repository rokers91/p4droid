import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:p4droid/src/constants/app_colors_pallette.dart';
import 'package:p4droid/src/extensions/screen_utils_context_extension.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants/states_contants.dart';
import '../../core/respositories/events_respository.dart';
import '../../models/event_model.dart';

class HomeController extends GetxController {
  final EventRepository eventRepository = EventRepository();

  //manejo del estado de los widgets
  var saveStatus = SaveStatus.success.obs;

  //para manipular los eventos
  var isLoading = false.obs;


  //manejo del dialogo para añadir eventos
  var formKey = GlobalKey<FormState>();
  var title = TextEditingController();
  var description = TextEditingController();
  var date = DateTime.now().obs;
  var time = TimeOfDay.now().obs;
  var color = AppPalette.backgroundColor.obs;
  var reminder = false.obs;


  //manejo de lo necesario del calendario
  var events = <Event>[].obs;
  var event = Event(id: 0, title: '', description: '', date: DateTime.now(), time: TimeOfDay.now(), color: AppPalette.primaryColor).obs;
  var selectedDay = DateTime.now().obs;
  var calendarFormat = CalendarFormat.month.obs;

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  //metodos par el manejo del calendario
  List getEventsForDay(DateTime day) {
    loadEvents();
    return events.where((event) => isSameDay(event.date, day)).toList();

  }

  ////////////////////////////////////////
  //metodos para la validacion del formulario de añadir eventos
  String? validarTitulo(String? value) {
    if (value == null || value.isEmpty) {
      return 'El título es requerido';
    }
    return null;
  }

  String? validarDescripcion(String? value) {
    if (value == null || value.isEmpty) {
      return 'La descripción es requerida';
    }
    return null;
  }

  Future<void> loadEvents() async {
    events.value = await eventRepository.getEvents();
    update();
  }

  Future<void> guardarEvento() async {
    try {
      isLoading.value = true;
      await eventRepository.addEvent(
        title: title.text,
        description: description.text,
        date: date.value,
        time: time.value,
        color: color.value,
        reminder: reminder.value,
      );
      // saveStatus.value = SaveStatus.success;
      await Future.delayed(const Duration(seconds: 3));
      reset();
      loadEvents();
    } catch(e){
      // saveStatus.value = SaveStatus.error;
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> actualizarEvento(Event event) async {
    try{
      isLoading.value = true;
      await eventRepository.updateEvent(event);
      await Future.delayed(const Duration(seconds: 3));
    }catch(e){
      rethrow;
    }finally{
      isLoading.value = false;
    }

    loadEvents();
  }

  Future<void> eliminarEvento(Event event) async {
    try {
      isLoading.value = true;
      await eventRepository.deleteEvent(event.id);
      loadEvents();
      await Future.delayed(const Duration(seconds: 3));

    } catch(e){
      rethrow;
    } finally{
      isLoading.value = false;
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.value,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
    );
    if (picked != null) {
      date.value = picked;
    }
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time.value,
    );
    if (picked != null) {
      time.value = picked;
    }
  }

  void pickColor(BuildContext context) async {
    final MaterialColor? picked = await showDialog<MaterialColor>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecciona un color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: color.value,
              onColorChanged: (newColor) {
                color.value = newColor;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('GUARDAR'),
              onPressed: () {
                Get.back(result: color.value);
              },
            ),
          ],
        );
      },
    );
    if (picked != null) {
      color.value = picked;
    }
  }

  void processResultAddEvent(bool? result){
    if(result != null){
      if (result == true) {
        showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              const dialog = AlertDialog(
                title: Text('Éxito'),
                content: Text('La información ha sido guardada correctamente.'),
              );
              // Esperar 2 segundos antes de cerrar el dialog
              returnTwoSecondsBack();
              return dialog;
            }
        );
      } else if (result == false) {
        showDialog(
            context: Get.context!,
            builder: (BuildContext context){
              const dialog = AlertDialog(
                title: Text('Error'),
                content: Text('No se pudo guardar la información. Por favor, inténtelo de nuevo.'),
              );
              returnTwoSecondsBack();
              return dialog;
            }
        );
      }
    } else {
      showDialog(
          context: Get.context!,
          builder: (BuildContext context){
            const dialog = AlertDialog(
              title: Text('Error'),
              content: Text('El usuario canceló la navegación!'),
            );
            returnTwoSecondsBack();
            return dialog;
          }
      );
    }
  }

  void returnTwoSecondsBack() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
    });
  }

  void reset() {
    title.clear();
    description.clear();
    date.value = DateTime.now();
    time.value = TimeOfDay.now();
    color.value = Colors.blue;
    reminder.value = false;
  }

  //tengo que usar estos métodos
  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('HH:mm').format(dateTime);
  }
  ////////////////////////////////////////


  //dialogos que brindan informacion al usuario
  void showDetalisEventoDialog(Event event){
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(context.setWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: context.setSp(20),
                    fontWeight: FontWeight.bold,
                    color: event.color,
                  ),
                ),
                SizedBox(height: context.setHeight(16)),
                Text(
                  'Descripción:',
                  style: TextStyle(
                    fontSize: context.setSp(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.setHeight(4)),
                Text(
                  event.description,
                  style: TextStyle(
                    fontSize: context.setSp(14),
                  ),
                ),
                SizedBox(height: context.setHeight(16)),
                Text(
                  'Fecha:',
                  style: TextStyle(
                    fontSize: context.setSp(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.setHeight(4)),
                Text(
                  DateFormat.yMMMMd().format(event.date),
                  style: TextStyle(
                    fontSize: context.setSp(14),
                  ),
                ),
                SizedBox(height: context.setHeight(16)),
                Text(
                  'Hora:',
                  style: TextStyle(
                    fontSize: context.setSp(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.setHeight(4)),
                Text(
                  event.time.format(context),
                  style: TextStyle(
                    fontSize: context.setSp(14),
                  ),
                ),
                SizedBox(height: context.setHeight(16)),
                Row(
                  children: [
                    Icon(
                      event.reminder ? Icons.alarm : Icons.alarm_off,
                      size: context.setWidth(24),
                      color: event.reminder ? Colors.blue : Colors.grey,
                    ),
                    SizedBox(width: context.setWidth(8)),
                    Text(
                      event.reminder
                          ? 'Tiene recordatorio'
                          : 'No tiene recordatorio',
                      style: TextStyle(
                        fontSize: context.setSp(14),
                        color: event.reminder ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.setHeight(16)),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Cerrar',
                      style: TextStyle(fontSize: context.setSp(16)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showEditarEventoDialog(Event event){
    title = TextEditingController(text: event.title);
    description = TextEditingController(text: event.description);
    date.value = event.date;
    time.value = event.time;
    color.value = event.color;
    reminder.value = event.reminder;
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar evento', style: TextStyle(fontSize: context.setSp(20))),
          content: Padding(
            padding: EdgeInsets.all(context.setSp(8)),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        labelText: 'Título',
                        labelStyle: TextStyle(fontSize: context.setSp(14)),
                      ),
                      onSaved: (value) {
                        title.text = value!;
                      },
                      style: TextStyle(fontSize: context.setSp(16)),
                      // validator: controller.validarTitulo,
                    ),
                    TextFormField(
                      controller: description,
                      decoration: InputDecoration(
                        labelText: 'Descripción',
                        labelStyle: TextStyle(fontSize: context.setSp(14)),
                      ),
                      onSaved: (value) {
                        description.text = value!;
                      },
                      style: TextStyle(fontSize: context.setSp(16)),
                      // validator: controller.validarDescripcion,
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          ListTile(
                            title: Text('Fecha', style: TextStyle(fontSize: context.setSp(14))),
                            subtitle: Text(
                              '${date.value.day}/${date.value.month}/${date.value.year}',
                              style: TextStyle(fontSize: context.setSp(16)),
                            ),
                            onTap: () {
                              selectDate(context);
                            },
                          ),
                          ListTile(
                            title: Text('Hora', style: TextStyle(fontSize: context.setSp(14))),
                            subtitle: Text(
                              time.value.format(context),
                              style: TextStyle(fontSize: context.setSp(16)),
                            ),
                            onTap: () {
                              selectTime(context);
                            },
                          ),
                          ListTile(
                            title: Text('Color', style: TextStyle(fontSize: context.setSp(14))),
                            subtitle: Container(
                              height: context.setHeight(5),
                              width: context.setHeight(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context.setWidth(5)),
                                color: color.value,
                              ),
                            ),
                            onTap: () {
                              pickColor(context);
                            },
                          ),
                          SwitchListTile(
                            title: Text('Recordatorio', style: TextStyle(fontSize: context.setSp(14))),
                            value: reminder.value,
                            onChanged: (value) {
                              reminder.value = value;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              actualizarEvento(Event(
                                id: event.id,
                                title: title.value.text,
                                description: description.value.text,
                                date: date.value,
                                time: time.value,
                                color: color.value,
                                reminder: reminder.value,
                              ));
                              reset();
                              Get.back();
                              Get.back();
                            },
                            child: Text('Guardar cambios', style: TextStyle(fontSize: context.setSp(16))),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancelar', style: TextStyle(fontSize: context.setSp(16), color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void showEliminarEventoDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar evento'),
          content: const Text('¿Estás seguro de que quieres eliminar este evento?'),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                // Eliminar el evento
                eliminarEvento(event);
                Get.back();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}