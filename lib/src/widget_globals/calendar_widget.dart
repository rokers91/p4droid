// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../models/calendar_model.dart';
//
//
// class CalendarioWidget extends StatefulWidget {
//   const CalendarioWidget({super.key});
//
//   @override
//   CalendarioWidgetState createState() => CalendarioWidgetState();
// }
//
// class CalendarioWidgetState extends State<CalendarioWidget> {
//   final _eventoRepository = EventoRepository();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<EventModel>>(
//       future: _eventoRepository.getEventos(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final eventos = snapshot.data;
//           final mapaEventos = <DateTime, List<EventModel>>{};
//           for (var evento in eventos!) {
//             final fecha = DateTime(
//               evento.date.year,
//               evento.date.month,
//               evento.date.day,
//             );
//             if (mapaEventos[fecha] == null) {
//               mapaEventos[fecha] = [];
//             }
//             mapaEventos[fecha]?.add(evento);
//           }
//           return TableCalendar(
//             events: mapaEventos,
//             calendarStyle: CalendarStyle(
//               todayColor: Colors.blue[100],
//               selectedColor: Colors.blue[300],
//               markersColor: Colors.blue[700],
//             ),
//             headerStyle: HeaderStyle(
//               centerHeaderTitle: true,
//               formatButtonVisible: false,
//             ),
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             availableCalendarFormats: {
//               CalendarFormat.month: 'Mes',
//             },
//             builders: CalendarBuilders(
//               markersBuilder: (context, date, events, holidays) {
//                 final markers = <Widget>[];
//                 if (events != null) {
//                   for (var evento in events) {
//                     markers.add(
//                       Positioned(
//                         bottom: 1,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.blue[700],
//                           ),
//                           width: 5.0,
//                           height: 5.0,
//                         ),
//                       ),
//                     );
//                   }
//                 }
//                 return markers;
//               },
//             ),
//             onDaySelected: (date, events, holidays) async {
//               if (events != null && events.isNotEmpty) {
//                 final evento = events.first;
//                 await Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => AgregarEventoPage(
//                       evento: evento,
//                     ),
//                   ),
//                 );
//                 setState(() {});
//               }
//             },
//             onDayLongPressed: (date, events, holidays) async {
//               await Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => AgregarEventoPage(
//                     fecha: date,
//                   ),
//                 ),
//               );
//               setState(() {});
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error al cargar los eventos'),
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }