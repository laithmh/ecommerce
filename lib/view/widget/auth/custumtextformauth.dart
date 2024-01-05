import 'package:flutter/material.dart';

class Custumtextform extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final bool isnumber;
  final TextEditingController? mycontroller;
  final bool? obscuretext;
  final String? Function(String?) valid;
  final void Function()? onTapicon;
  const Custumtextform(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isnumber,
      this.obscuretext,
      this.onTapicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: isnumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscuretext == null || obscuretext == false ? false : true,
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
          prefixIcon: InkWell(onTap: onTapicon, child: Icon(iconData)),
        ));
  }
}
