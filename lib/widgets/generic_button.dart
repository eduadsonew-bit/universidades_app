import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  String label;
  Function() ontap;

  GenericButton(this.label, this.ontap);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(label),
      onPressed: () {
        ontap();
      },
    );
  }
}

