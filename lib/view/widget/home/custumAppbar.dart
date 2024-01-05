import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  final String titelappbar;
  final void Function()? onPressednotificatoin;
  final void Function()? onPressedsearch;
  final void Function()? onPressediconfavorite;
  final void Function(String)? onchange;
  final TextEditingController mycontroller;

  const Customappbar(
      {super.key,
      required this.titelappbar,
      this.onPressednotificatoin,
      this.onPressedsearch,
      required this.onPressediconfavorite,
      this.onchange,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onchange,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPressedsearch,
                    icon: const Icon(Icons.search_outlined)),
                hintText: titelappbar,
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onPressednotificatoin,
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  size: 25,
                  color: Color.fromARGB(255, 83, 83, 83),
                )),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onPressediconfavorite,
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                  color: Color.fromARGB(255, 83, 83, 83),
                )),
          ),
        ],
      ),
    );
  }
}
