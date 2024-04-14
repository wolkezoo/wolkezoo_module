import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wolkezoo_module/material/wolke_material_app.dart';

// go to the second page
Future to({
  required Widget page,
  Transition? transition,
  dynamic arguments,
}) async {
  return Get.to(
    () => page,
    transition: transition,
    binding: controllerBinding,
    arguments: arguments,
  );
}

// back page
void back<T>({T? result}) => Get.back(result: result);

// back more page
void moreBack<T>({required int step, T? result}) => {
      for (int i = 0; i < step; i++)
        {
          if (i == step - 1) Get.back(result: result) else Get.back(),
        }
    };

Future moreOffTo({
  required int offStep,
  required Widget page,
  Transition? transition,
  dynamic arguments,
}) {
  for (int i = 0; i < offStep; i++) {
    Get.back();
  }

  return to(page: page, transition: transition, arguments: arguments);
}

// Exit the current interface and jump to another page
Future off({
  required Widget page,
  Transition? transition,
  dynamic arguments,
}) async {
  return Get.off(() => page, transition: transition, binding: controllerBinding);
}

// Exit all interface and jump to another page
Future allOff({
  required Widget page,
  Transition? transition,
  dynamic arguments,
}) async {
  return Get.offAll(() => page, transition: transition, binding: controllerBinding);
}
