// import 'package:flutter/material.dart';
// import 'package:freelance_job_portal/core/constants/colors.dart';
// import 'package:freelance_job_portal/features/chat/presentation/views/chat.dart';
// import 'package:freelance_job_portal/features/home/presentation/views/home.dart';
// import 'package:freelance_job_portal/features/my_project/presentation/views/my_project.dart';
// import 'package:freelance_job_portal/features/profile/presentation/views/profile.dart';
// import 'package:freelance_job_portal/features/wallet/presentation/views/wallet.dart';
// import 'package:iconly/iconly.dart';
// import 'package:navigation_view/item_navigation_view.dart';
// import 'package:navigation_view/navigation_view.dart';

// class ButtomNavigationBar extends StatefulWidget {
//   const ButtomNavigationBar({super.key});

//   @override
//   State<ButtomNavigationBar> createState() => _ButtomNavigationBarState();
// }

// class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
//    int _currentIndex = 0;

//   final List<Widget> _pages = [
//     const Home(),
//     const Chat(),
//     const Wallet(),
//     const MyProject (),
//     const Profile(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return NavigationView(
//         backgroundColor: Theme.of(context).primaryColor,
//         curve: Curves.fastEaseInToSlowEaseOut,
//         //durationAnimation: const Duration(microseconds: 1000),
//         color: Theme.of(context).primaryColor,
//         borderTopColor: primaryColer,
//         onChangePage: (index) {
//            setState(() {
//             _currentIndex = index;
//              });
//         },
//         items: [
//              ItemNavigationView(
//               childAfter: const Icon(
//                 IconlyBold.home,
//                 color: primaryColer,
//                 size: 30,
//               ),
//               childBefore: const Icon(
//                 IconlyBold.home,
//                 color: Colors.white,
//                 size: 30,
//               )),
//           ItemNavigationView(
//               childAfter: const Icon(
//                 IconlyBold.chat,
//                 color: primaryColer,
//                 size: 30,
//               ),
//               childBefore: const Icon(
//                 IconlyBold.chat,
//                 color: Colors.white,
//                 size: 30,
//               )),
         
//           ItemNavigationView(
//               childAfter: const Icon(
//                 IconlyBold.search,
//                 color: primaryColer,
//                 size: 30,
//               ),
//               childBefore: const Icon(
//                 IconlyBold.search,
//                 color: Colors.white,
//                 size: 30,
//               )), ItemNavigationView(
//               childAfter: const Icon(
//                 IconlyBold.bag,
//                 color: primaryColer,
//                 size: 30,
//               ),
//               childBefore: const Icon(
//                 IconlyBold.bag,
//                 color: Colors.white,
//                 size: 30,
//               )),
         
//                ItemNavigationView(
//               childAfter: const Icon(
//                 IconlyBold.profile,
//                 color: primaryColer,
//                 size: 30,
//               ),
//               childBefore: const Icon(
//                 IconlyBold.profile,
//                 color: Colors.white,
//                 size: 30,
//               )),
       
//         ]);
//   }
// }
