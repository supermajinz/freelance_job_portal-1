// import 'package:flutter/material.dart';
// import 'package:timelines/timelines.dart';

// import '../../../../../core/utils/size_config.dart';
// import '../../../../../core/widget/custom_label.dart';

// class CustomTimeline extends StatelessWidget {
//   final int currentStatus;

//   const CustomTimeline({super.key, required this.currentStatus});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height: SizeConfig.defaultSize! * 9,
//         child: Timeline.tileBuilder(
//           scrollDirection: Axis.horizontal,
//           builder: TimelineTileBuilder.connected(
//             connectionDirection: ConnectionDirection.before,
//             itemCount: 4,
//             contentsBuilder: (context, index) {
//               switch (index) {
//                 case 0:
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: SizeConfig.defaultSize! * 2.5,
//                         vertical: SizeConfig.defaultSize! * .8),
//                     child: const CustomLabel(
//                       text: 'مطبق/نشط',
//                     ),
//                   );
//                 case 1:
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: SizeConfig.defaultSize! * 2.5,
//                         vertical: SizeConfig.defaultSize! * .8),
//                     child: const CustomLabel(
//                       text: 'في تَقَدم',
//                     ),
//                   );
//                 case 2:
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: SizeConfig.defaultSize! * 2.5,
//                         vertical: SizeConfig.defaultSize! * .8),
//                     child: const CustomLabel(
//                       text: 'تم التوصيل',
//                     ),
//                   );
//                 case 3:
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: SizeConfig.defaultSize! * 2.5,
//                         vertical: SizeConfig.defaultSize! * .8),
//                     child: const CustomLabel(
//                       text: 'مكتمل',
//                     ),
//                   );
//                 default:
//                   return null;
//               }
//             },
//             indicatorBuilder: (context, index) {
//               return DotIndicator(
//                 color: index <= currentStatus ? Colors.blue : const Color.fromARGB(255, 206, 204, 204),
//               );
//             },
//             connectorBuilder: (context, index, type) {
//               return SolidLineConnector(
//                 direction: Axis.horizontal,
//                 color: index <= currentStatus ? Colors.blue : const Color.fromARGB(255, 206, 204, 204),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_label.dart';

class CustomTimeline extends StatelessWidget {
  final int currentStatus;

  const CustomTimeline({super.key, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: SizeConfig.defaultSize! * 13,
        child: Timeline.tileBuilder(
          scrollDirection: Axis.horizontal,
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: 4,
            contentsBuilder: (context, index) {
              String text;

              switch (index) {
                case 0:
                  text = 'مطبق/نشط';
                  break;
                case 1:
                  text = 'في تَقَدم';
                  break;
                case 2:
                  text = 'تم التوصيل';
                  break;
                case 3:
                  text = 'مكتمل';
                  break;
                default:
                  text = 'غير معروف';
              }

              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * 2.4,
                    vertical: SizeConfig.defaultSize! * 0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: SizeConfig.defaultSize! * .5),
                    CustomLabel(
                      text: text,
                      color: index <= currentStatus
                          ? Colors.green
                          : const Color.fromARGB(255, 155, 152, 152),
                    ),
                  ],
                ),
              );
            },
            indicatorBuilder: (context, index) {
              bool isActive = index <= currentStatus;
              double size = isActive
                  ? SizeConfig.defaultSize! * 3
                  : SizeConfig.defaultSize! * 2;

              return Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.transparent,
                  border: Border.all(
                    color: isActive
                        ? Colors.green
                        : const Color.fromARGB(255, 155, 152, 152),
                    width: 5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: isActive
                    ? Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: SizeConfig.defaultSize! * 2,
                        ),
                      )
                    : null,
              );
            },
            connectorBuilder: (context, index, type) {
              return SolidLineConnector(
                thickness: 5,
                color: index <= currentStatus
                    ? Colors.green
                    : const Color.fromARGB(255, 155, 152, 152),
              );
            },
          ),
        ),
      ),
    );
  }
}
