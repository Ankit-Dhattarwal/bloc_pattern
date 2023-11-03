import 'package:bloc_pattern/Bloc/Internet_Bloc/internet_bloc.dart';
import 'package:bloc_pattern/Bloc/Internet_Bloc/internet_state.dart';
import 'package:bloc_pattern/Cubits/internet_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//<------------------NOTE-------------->
/*
Bloc builder ko jab b tum koi bloc deva ga , jab b usma kuch change hov ga
, state change hov ge too uske bare mai btaye ga.

2.  Diff b/w == and is :
 == to use check value equal or not ( compare )
 is use to check data type

3.  Bloc bulider ui bananae k kaam aata hai
lisner kuch background task k kaam aata hai
lisner se tum snakbar deka ko sakte ho , next screen pe ja sakte ho..
so , lisner hi use kiya like blocLisner jukar blocbulider use kara ha
too ui koni bana

4.  Dono ko use karana hai bulider ka b or lisner ka taki task n karba saka or ui b banva saka too,
use kara aapa bloc consumer

5. At last bss ui chaiye too Blocbulider use kro ya bss backgroud task karvan hai too Bloclisner use kro
agar dono karna hai too blocConsumer use karo.



 */




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(

          //  <----------------------Cubit part ----------------------------------->

          /*
          yaha kya hai ki ab aapa is na use kar k == use kara ga
          kyuki ab enum use kra hai too is use hota hai data type check karne mai
          or ab enum use kre hai too ab jo b internetstate hai ab voo value hai , na ki datatype

           */
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (BuildContext context, InternetState state) {
              if(state == InternetState.Gained){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Internet connected', style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.yellow,
                  ),
                );
              }
              else if(state == InternetState.Lost){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Internet not connected',style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.teal,
                  ),
                );
              }
            },
            builder: (BuildContext context, state) {
                    if(state == InternetState.Gained){
                         return Text('Connected!');
                    }
                   else if(state == InternetState.Lost){
                          return Text('DisConnected!');
                   }
                  else{
                          return Text('Loading...');
                  }
            },
          ),

          //  <----------------------Bloc part ----------------------------------->

          // child: BlocConsumer<InternetBloc, InternetState>(
          //   listener: (BuildContext context, InternetState state) {
          //     if(state is InternetGainedState){
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text('Internet connected'),
          //           backgroundColor: Colors.green,
          //         ),
          //       );
          //     }
          //     else if(state is InternetLostState){
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text('Internet not connected'),
          //           backgroundColor: Colors.red,
          //         ),
          //       );
          //     }
          //   },
          //   builder: (BuildContext context, state) {
          //     if(state is InternetGainedState){
          //       return Text('Connected!');
          //     }
          //     else if(state is InternetLostState){
          //       return Text('DisConnected!');
          //     }
          //     else{
          //       return Text('Loading...');
          //     }
          //   },
          // ),



          // child: BlocBuilder<InternetBloc, InternetState>(
          //     builder: (BuildContext context, state) {
          //       if(state is InternetGainedState){
          //         return Text('Connected!');
          //       }
          //       else if(state is InternetLostState){
          //         return Text('DisConnected!');
          //       }
          //       else{
          //         return Text('Loading...');
          //       }
          //     },
          // ),
        ),
      ),
    );
  }
}
