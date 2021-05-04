import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultTextFormField({
  @required controller,
  @required textType,
  @required String label,
  @required prefixIcon,
  @required String validateMessage,
  @required maxLength,
}) => TextFormField(
      controller: controller,
      keyboardType: textType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
      ),
      validator: (String controller) {
        if (controller.isEmpty) return validateMessage;
        else if(controller.length!=maxLength)return "Please enter correct number";
        return null;
      },
    );

ProgressDialog loading(context)=>ProgressDialog(context,
    type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);

