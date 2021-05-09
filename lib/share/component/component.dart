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
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
      ),
      validator: (String controller) {
        if (controller.isEmpty)
          return validateMessage;
        else if (controller.length != maxLength)
          return "Please enter correct number";
        return null;
      },
    );

Widget searchTextField({
  @required textType,
  @required String hint,
  @required prefixIcon,
}) =>
    TextField(
      textAlignVertical: TextAlignVertical.bottom,
      textAlign: TextAlign.start,
      keyboardType: textType,
      style: TextStyle(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: hint,
        prefixIcon: prefixIcon,
      ),
      onChanged: (value) {
        //TODO: on code change go to database and get meals
      },
    );

ProgressDialog loading(context) => ProgressDialog(context,
    type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);

Widget circleImage({
  @required double width,
  @required double height,
  @required image,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
          )),
    );
