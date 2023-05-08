import 'package:flutter/material.dart';

class CustomSwitchTileWidget extends StatelessWidget {
  final String label;
  final dynamic value;
  // final List<dynamic> options;
  final Function(dynamic) onChanged;

  const CustomSwitchTileWidget({super.key,
    required this.label,
    required this.value,
    // this.options = const [],
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Switch(
            value: value,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}

//     : DropdownButton(
//   value: value,
//   items: options
//       .map((option) => DropdownMenuItem(
//     value: option,
//     child: Text(option),
//   ))
//       .toList(),
//   onChanged: onChanged,
// ),