import 'package:flutter/material.dart';

class Custumcarttextform extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;

  final TextEditingController? mycontroller;

  const Custumcarttextform(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(66),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(labeltext)),
          hintText: hinttext,
          hintStyle: const TextStyle(
              fontSize: 10, color: Color.fromARGB(255, 104, 104, 104)),
          prefixIcon: InkWell(child: Icon(iconData)),
        ));
  }
}
