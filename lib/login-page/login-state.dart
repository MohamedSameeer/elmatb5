abstract class LoginState{
}
class LoginInitState extends LoginState{}
class LoginErrorState extends LoginState{}
class LoginCodeSentState extends LoginState{
  String verificationId;
  LoginCodeSentState(this.verificationId);
}
class LoginGoHomeState extends LoginState{}
class LoginLoadingState extends LoginState{}