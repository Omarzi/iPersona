// import 'package:persona2/core/component/custom/custom_drawer.dart';
// import 'package:persona2/core/component/custom/open_end_drawer_button.dart';
// import 'package:persona2/core/config/routes/app.dart';

// class BookScreen2 extends StatelessWidget {
//   BookScreen2({super.key});
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       endDrawer: CustomDrawer(),
//       appBar: AppBar(actions: [OpenEndDrawerButton(scaffoldKey: scaffoldKey)]),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10.w),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 FloatingActionButton(
//                   onPressed: () {},
//                   backgroundColor: Theme.of(context).primaryColor,
//                   mini: true,
//                   child: Icon(Icons.arrow_back),
//                 ),
//                 Spacer(),
//                 Text(
//                   'Therapist Profile',
//                   style: TextStyle(
//                     fontSize: 20.r,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Spacer(flex: 2),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
