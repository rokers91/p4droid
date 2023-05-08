//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
//
// class CustomDialogModel {
//   final String title;
//   final String message;
//   final String confirmButtonText;
//   final String cancelButtonText;
//   final Function(bool, Color) onConfirm;
//
//   CustomDialogModel({
//     required this.title,
//     required this.message,
//     required this.confirmButtonText,
//     required this.cancelButtonText,
//     required this.onConfirm,
//   });
// }
//
// class CustomDialog extends StatefulWidget {
//   final CustomDialogModel model;
//
//   CustomDialog({required this.model});
//
//   @override
//   _CustomDialogState createState() => _CustomDialogState();
// }
//
// class _CustomDialogState extends State<CustomDialog> {
//   Color _selectedColor = Colors.blue;
//   ColorPickerDialog _colorPickerDialog = ColorPickerDialog();
//
//   void _pickColor(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           titlePadding: const EdgeInsets.all(0),
//           contentPadding: const EdgeInsets.all(0),
//           content: SingleChildScrollView(
//             child: ColorPicker(
//               pickerColor: _selectedColor,
//               onColorChanged: (color) {
//                 setState(() {
//                   _selectedColor = color;
//                 });
//               },
//               colorPickerWidth: 300.0,
//               pickerAreaHeightPercent: 0.7,
//               enableAlpha: false,
//               displayThumbColor: true,
//               showLabel: true,
//               paletteType: PaletteType.hsv,
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('CANCEL'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _colorPickerDialog.selectedColor = _selectedColor;
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(widget.model.title),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(widget.model.message),
//           SizedBox(height: 16),
//           Row(
//             children: [
//               Text('Color: '),
//               SizedBox(width: 8),
//               GestureDetector(
//                 onTap: () {
//                   _pickColor(context);
//                 },
//                 child: Container(
//                   width: 16,
//                   height: 16,
//                   decoration: BoxDecoration(
//                     color: _colorPickerDialog.selectedColor,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             widget.model.onConfirm(false, _selectedColor);
//             Navigator.of(context).pop();
//           },
//           child: Text(widget.model.cancelButtonText),
//         ),
//         TextButton(
//           onPressed: () {
//             widget.model.onConfirm(true, _selectedColor);
//             Navigator.of(context).pop();
//           },
//           child: Text(widget.model.confirmButtonText),
//         ),
//       ],
//     );
//   }
// }