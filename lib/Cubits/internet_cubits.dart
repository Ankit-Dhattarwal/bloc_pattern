
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//<--------NOTE------------->
/*
 1. super kya hoga super se cubit initialised hoga too cubit ko initail state deni hoge so use like-->  super(InternetState.Initial);

 2. too esma aapna na event add karna ki chinta nhi krne pde bss emit kro
 */

enum InternetState {Initial , Gained, Lost}

class InternetCubit extends Cubit<InternetState>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.Initial){
    connectivitySubscription = _connectivity.onConnectivityChanged.listen(
            (result) {
              if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
                emit(InternetState.Gained);
              }
              else{
                emit(InternetState.Lost);
              }

    });
  }

  // Here use of close function beacuse we want jab cubit end hojya too connectivitySubscription b end hojya

@override
  Future<void> close() {
    // TODO: implement close
  connectivitySubscription?.cancel();
    return super.close();
  }

}