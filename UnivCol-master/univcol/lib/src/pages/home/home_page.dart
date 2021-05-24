// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:univcol/src/pages/UIS/bloc/bloc/uispagesbloc_bloc.dart';
// import 'package:univcol/src/pages/pages.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UispagesBloc(),
//       child: Scaffold(
//         body: BlocBuilder<UispagesBloc, UispagesblocState>(
//           builder: (_, state) {
//             if (state is UisPageHome) {
//               return Center(child: CircularProgressIndicator());
//             } else {
//               return UisPage();
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             check(context);
//           },
//         ),
//       ),
//     );
//   }

//   Future check(BuildContext context) async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       internet(context);
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       internet(context);
//     } else {
//       noInternet(context);
//     }
//   }

//   noInternet(BuildContext context) {
//     BlocProvider.of<UispagesBloc>(context).add(UispagesblocEvent.pagHome);
//   }

//   internet(BuildContext context) {
//     BlocProvider.of<UispagesBloc>(context).add(UispagesblocEvent.pageInit);
//   }
// }

// class NoConnetion extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: CircularProgressIndicator());
//   }
// }
