import 'package:e_commerce/controller/navigatorcontroller.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// ignore: must_be_immutable
class Customappbarbuttom extends GetView<Navigatorcontrollerimp> {
  final String textbutton;
  final Function()? onPressed;
  final IconData icondata;

  final bool active;
  const Customappbarbuttom({
    super.key,
    required this.active,
    required this.onPressed,
    required this.textbutton,
    required this.icondata,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icondata,
              color: active == true ? Appcolor.green : Appcolor.black),
          // Text(
          //   textbutton,
          //   style: TextStyle(
          //       color: active == true ? Appcolor.green : Appcolor.black),
          // )
        ],
      ),
    );
  }
}

class Custombuttonapppar extends StatelessWidget {
  const Custombuttonapppar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Navigatorcontrollerimp>(
      builder: (controller) => BottomAppBar(
        color: Appcolor.appel,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listpage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : Customappbarbuttom(
                      textbutton: controller.buttonappbar[i]['title'],
                      icondata: controller.buttonappbar[i]['icon'],
                      onPressed: () {
                        controller.changepage(i);
                      },
                      active: controller.currentpage == i ? true : false,
                    );
            })
          ],
        ),
      ),
    );
  }
}
