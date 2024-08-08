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
        height: SizeConfig.defaultSize! * 9,
        child: Timeline.tileBuilder(
          scrollDirection: Axis.horizontal,
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: 4,
            contentsBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * 2.5,
                        vertical: SizeConfig.defaultSize! * .8),
                    child: const CustomLabel(
                      text: 'مطبق/نشط',
                    ),
                  );
                case 1:
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * 2.5,
                        vertical: SizeConfig.defaultSize! * .8),
                    child: const CustomLabel(
                      text: 'في تَقَدم',
                    ),
                  );
                case 2:
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * 2.5,
                        vertical: SizeConfig.defaultSize! * .8),
                    child: const CustomLabel(
                      text: 'تم التوصيل',
                    ),
                  );
                case 3:
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * 2.5,
                        vertical: SizeConfig.defaultSize! * .8),
                    child: const CustomLabel(
                      text: 'مكتمل',
                    ),
                  );
                default:
                  return null;
              }
            },
            indicatorBuilder: (context, index) {
              return DotIndicator(
                color: index <= currentStatus ? Colors.blue : const Color.fromARGB(255, 206, 204, 204),
              );
            },
            connectorBuilder: (context, index, type) {
              return SolidLineConnector(
                direction: Axis.horizontal,
                color: index <= currentStatus ? Colors.blue : const Color.fromARGB(255, 206, 204, 204),
              );
            },
          ),
        ),
      ),
    );
  }
}
