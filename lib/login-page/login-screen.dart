import 'package:elmatb5/home-page/home-screen.dart';
import 'package:elmatb5/login-page/login-cubit.dart';
import 'package:elmatb5/share/component/component.dart';
import 'package:elmatb5/share/cubit/app-cubit.dart';
import 'package:elmatb5/share/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'login-state.dart';

class Login extends StatelessWidget {
  var phoneController = TextEditingController();
  bool codeSent = false;
  var loginPhoneFormKey = GlobalKey<FormState>();
  var loginSmsCodeFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (BuildContext context, state) {
        if (state is LoginCodeSentState) {
          codeSent = true;
          loading(context).hide();
          dialog(context, state.verificationId);
        } else if (state is LoginGoHomeState) {
          loading(context).hide();
          navigateAndFinish(context, Home());
        } else if (state is LoginLoadingState) {
          loading(context).show();
        } else {
          loading(context).hide();
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.brightness_2),
                onPressed: () {
                  AppCubit.getInstance(context).changeTheme();
                },
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Already have an Account",
                            style: Theme.of(context)
                                .textTheme
                                .headline4,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: loginPhoneFormKey,
                      child: defaultTextFormField(
                        controller: phoneController,
                        textType: TextInputType.phone,
                        label: "Phone number",
                        prefixIcon: Icon(Icons.phone_android),
                        validateMessage: "Please enter your phone number",
                        maxLength: 11,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(

                      onPressed: () {
                        if (loginPhoneFormKey.currentState.validate()) {
                          LoginCubit.getInstance(context)
                              .verifyNumber("+2"+phoneController.text);
                        }
                      },
                      child: Text(
                        "LOGIN",
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Alert dialog(context, String verificationId) {
    var messageController = TextEditingController();
    return Alert(
        context: context,
        title: "Message",
        content: Column(
          children: <Widget>[
            Form(
              key: loginSmsCodeFormKey,
              child: defaultTextFormField(
                controller: messageController,
                textType: TextInputType.number,
                label: "SMS Code",
                prefixIcon: Icon(Icons.message),
                validateMessage: "Please enter SMS code",
                maxLength: 6,
              ),
            ),
            SizedBox(height: 16.0,),
           /* TextButton(
              //TODO: 5leh ea2dr edos kol 2 min
              child: Text("Resend SMS code"),
                onPressed: (){
                  if (loginPhoneFormKey.currentState.validate()) {
                    LoginCubit.getInstance(context)
                        .verifyNumber("+2"+phoneController.text);
                  }
                },
                ),*/
          ],
        ),
        buttons: [
          DialogButton(
            color: buttonColor,
            onPressed: () {
              if (loginSmsCodeFormKey.currentState.validate())
                LoginCubit.getInstance(context)
                    .smsCode(verificationId, messageController.text);
            },
            child: Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 20,
              ),
            ),
          )
        ])..show();
  }

  //For normal dialog

}
