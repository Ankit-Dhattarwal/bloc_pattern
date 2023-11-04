
import 'package:bloc_pattern/Phone_auth_bloc/cubits/auth_cubit/auth_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
AuthCubit() : super( AuthInitialState()){

  // Yaha ye use nyu kiya gaya hai ki agar mai reload kru too hime page pe aau na ki sing wale page par
  User? currentUser = _auth.currentUser;
  if(currentUser != null){
    //loggedIn
    emit(AuthLoggedInState(currentUser));
  }
  else{
    //loggedOut
    emit(AuthLoggedOutState());
  }

}

String? _verificationId;

  void sendOTP(String phoneNumber) async {

    emit(AuthLoadingState());

    await _auth.verifyPhoneNumber(

    phoneNumber: phoneNumber,
    codeSent: (verificationId, forceResendingToken) {
      _verificationId = _verificationId;
      emit(AuthCodeSendState());
    },

    verificationCompleted: (phoneAuthCredential) {
      signInWithPhone(phoneAuthCredential);
    },

    verificationFailed: (error) {
      emit(AuthErrorState(error.message.toString()));
    },

    codeAutoRetrievalTimeout: (verificationId) {
      _verificationId = _verificationId;

    },

    );
  }

  void verifyOTP(String otp) async {

    emit(AuthLoadingState());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signInWithPhone(credential);

  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try{
      UserCredential userCredential = await
      _auth.signInWithCredential(credential);
      if(userCredential.user != null){
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch(ex){
      emit(AuthErrorState(ex.message.toString()));
    }
  }

  void LogOut() async{
    await _auth.signOut();
    emit( AuthLoggedOutState() );
  }
}