// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:republic_on_volga/domain/navigation/navigation_bloc.dart';
// import 'package:republic_on_volga/model/selected_item_menu.dart';
// import 'package:republic_on_volga/view/events_page/events_page.dart';
//
// import 'home_page/home_page.dart';
// import 'menu.dart';
//
// class MainContainerWidget extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return
//       BlocProvider<NavigationBloc>(
//         create: (context) => NavigationBloc(),
//         child: SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text('Текст'),
//               // backgroundColor: Colors.white,
//             ),
//             body: Container(
//               height: height,
//               width: width,
//               child: Stack(
//                 children: [
//                   BlocBuilder<NavigationBloc, NavigationState>(builder: (context, state) {
//                     if(state.selectedItem == NavItem.home_page){
//                       return HomePage();
//                     }
//                     if(state.selectedItem == NavItem.events_page){
//                       return EventsPage();
//                     }
//                     else{
//                       return HomePage();
//                     }
//                   },),
//                   Menu()
//                 ],
//               ),
//             )
//           // This trailing comma makes auto-formatting nicer for build methods.
//         ),
//     ),
//       );
//   }
// }
//
// _bodyForState(state){
//
// }
