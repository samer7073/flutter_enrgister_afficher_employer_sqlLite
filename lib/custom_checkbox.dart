
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    required this.onchanged,
    this.value,
    this.msg = "",
  }) : super(key: key);

  final void Function(bool?)? onchanged;
  final bool? value;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value ?? false, // Set a default value if 'value' is null
      title: Text(msg),
      onChanged: onchanged,
    );
  }
}
