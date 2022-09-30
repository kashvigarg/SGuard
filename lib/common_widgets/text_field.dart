import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataField extends StatelessWidget {
  const DataField({super.key, required this.labelData});
  final String labelData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          constraints: BoxConstraints(minHeight: 30, maxWidth: 286),
          labelText: labelData,
          fillColor: Colors.white,
          filled: true),
    );
  }
}
