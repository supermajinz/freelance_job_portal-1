// import 'package:animated_rating_bar/widgets/animated_rating_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:freelance_job_portal/core/utils/size_config.dart';
// import 'package:freelance_job_portal/core/widget/custom_label.dart';
// import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
// import 'package:freelance_job_portal/core/widget/space.dart';
// import 'package:intl/intl.dart';
// import '../../../../review/data/model/rate_model/rate.dart';

// class CustomReviewCardClient extends StatelessWidget {
//   const CustomReviewCardClient({super.key, required this.rate});
//   final Rate rate;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(
//                   horizontal: SizeConfig.defaultSize! * .5),
//               child: CircleAvatar(
//                 maxRadius: SizeConfig.defaultSize! * 3,
//                 backgroundImage: const AssetImage(
//                   "assets/images/pro.jpg",
//                 ),
//               ),
//             ),
//             const HorizintalSpace(1),
//             CustomSubTitleMedium(
//               text: rate.worker.userDto!.firstname!,
//             ),
//             const HorizintalSpace(23),
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.delete_sweep_outlined,
//                   size: 25,
//                 )),
//           ],
//         ),
//         const VirticalSpace(1.5),
//         Row(
//           children: [
//             AnimatedRatingBar(
//               activeFillColor: Theme.of(context).colorScheme.inversePrimary,
//               strokeColor: Colors.green,
//               initialRating: rate.totalRate,
//               height: SizeConfig.defaultSize! * 2,
//               width: SizeConfig.defaultSize! * 8,
//               animationColor: Colors.red,
//               onRatingUpdate: (rating) {
//                 debugPrint(rating.toString());
//               },
//             ),
//             const HorizintalSpace(1.5),
//             CustomLabel(
//               text: DateFormat('yyyy-MM-dd').format(rate.createDate),
//             )
//           ],
//         ),
//         const VirticalSpace(1),
//         Container(
//           margin:
//               EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * .8),
//           height: SizeConfig.defaultSize! * 7,
//           child: Text(rate.description,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.start,
//               maxLines: 3,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyLarge!
//                   .copyWith(color: Colors.grey)),
//         ),
//       ],
//     );
//   }
// }
