import 'package:elmatb5/login-page/login-state.dart';
import 'package:elmatb5/share/network/local/storage-manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super(LoginInitState());
  static LoginCubit getInstance(context)=>BlocProvider.of(context);

  //Login With Phone
  FirebaseAuth auth=FirebaseAuth.instance;

  Future verifyNumber(phoneNumber)async{
    emit(LoginLoadingState());
   // await auth.signInWithPhoneNumber(phoneNumber);
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential)async{
          //Android only
          await auth.signInWithCredential(phoneAuthCredential).then((value) {
            StorageManager.saveData("uId", value.user.uid);
             emit(LoginGoHomeState());
           }).catchError((onError){
             print("verification completed method error :  ${onError.toString()}");
          });
        },
        verificationFailed: (FirebaseException e){
          emit(LoginErrorState());
          if(e.code=='invalid-phone-number')
            print('The provided phone number is not valid.');
          else
            print('Verification Failed ${e.code}');
        },
        codeSent: (String verificationId, int resendToken){
              emit(LoginCodeSentState(verificationId));
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId){
              print("codeAutoRetrievalTimeout");
        }
    );
  }

  Future smsCode(verificationId,messageCode)async{
    emit(LoginLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: messageCode);
    await auth.signInWithCredential(credential).then((value) {
      StorageManager.saveData("uId", value.user.uid);
      emit(LoginGoHomeState());
    }).catchError((onError) {
      print("sms code error : ${onError.toString()}");
      emit(LoginErrorState());
    });
  }
}
