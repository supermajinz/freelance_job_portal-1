// import 'package:flutter/material.dart';
// import 'package:freelance_job_portal/core/utils/size_config.dart';
// import 'package:freelance_job_portal/core/widget/space.dart';
// import 'package:freelance_job_portal/features/chat/presentation/views/widget/custom_message_card.dart';
// import 'package:go_router/go_router.dart';
//
// class ChatBodyCopy extends StatelessWidget {
//   const ChatBodyCopy({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         const VirticalSpace(2),
//         //const CustomSearch(title: "Hinted search text"),
//         Container(
//           margin:
//               EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * .5),
//           height: SizeConfig.defaultSize! * 62,
//           color: Theme.of(context).cardColor,
//           child: ListView.separated(
//             separatorBuilder: (context, index) {
//               return Container(
//                   margin: EdgeInsets.symmetric(
//                       horizontal: SizeConfig.defaultSize! * 1),
//                   child: const Divider());
//             },
//             shrinkWrap: true,
//             itemCount: 9,
//             itemBuilder: (context, index) {
//               return InkWell(
//                   onTap: () {
//                     GoRouter.of(context).push("/dms");
//                   },
//                   child: const CustomMessageCard());
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
