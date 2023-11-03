//
// import 'dart:async';
//
// import 'package:bloc_pattern/Bloc/Internet_Bloc/internet_event.dart';
// import 'package:bloc_pattern/Bloc/Internet_Bloc/internet_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:connectivity/connectivity.dart';
//
// // Note----------Imp------------------
// // super extend class ko initilise kare k leye use hota hai
//
// // 1.    on<InternetLostEvents>((event, emit) => null);
// //     //Yaha function mai event or emit mil rha hai
// //     // event to vo hai jo tum de rhe ho like InternetLostEvents
// //     // emit ye ek fucntion jo state ko emit karta hai
//
// //2.     jis page pe tum bloc use karo ge or jab b vo page close hoye ga too tumhara bloc b close ho jaye ga
//
// //3.    Bloc to close ho jaye ga par listen nhi hoga ye baar baar call hoga or ye performance pe effect kare ga
//         // too aapa use kare ga StreamSubscription
//          // too listen b bloc close hoga tab listen b ho jaye ga
//
//
//
// class InternetBloc extends Bloc<InternetEvents, InternetState> {
//
//   Connectivity _connectivity = Connectivity();
//   StreamSubscription? connectivitySubscription;
//
//
//   //super ko initial state deni hote hai
//   InternetBloc() : super(InternetInitialState() ) {
//
//     //On check kare ga konsa se event aaya or kon sa nhi aaya
//     on<InternetLostEvents>((event, emit) => emit(InternetLostState()));
//     on<InternetGainedEvents>((event, emit) => emit(InternetGainedState()));
//
//     connectivitySubscription =   _connectivity.onConnectivityChanged.listen((result) {
//       if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
//         add(InternetGainedEvents());
//       }
//       else{
//         add(InternetLostEvents());
//       }
//     });
//   }
//
//   @override
//   Future<void> close() {
//     // ? this is for optional beacuse active ho tabi ho varna na ho
//     connectivitySubscription?.cancel();
//     return super.close();
//   }
// }
