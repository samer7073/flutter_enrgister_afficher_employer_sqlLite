

import 'package:flutter/material.dart';

class CustomRadioBox extends StatelessWidget {
  const CustomRadioBox({
    super.key,
    required this.onchanged,
    this.value="",
    this.groupvalue = "",
    this.soustitre = "",
    this.titre ="",
    });

  final void Function(String?)? onchanged;
  final String value;
  final String groupvalue;
  final soustitre;
  final titre;
  
  
  @override
  Widget build(BuildContext context) {
    return 
    RadioListTile(
      title: Text(titre),
      subtitle : Text(soustitre),
      value: value,
       groupValue: groupvalue,
        onChanged: onchanged);
        
  }

}
