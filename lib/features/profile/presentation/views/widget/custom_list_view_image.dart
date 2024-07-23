import 'dart:async';

import 'package:blur/blur.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:go_router/go_router.dart';

class CustomListViewImage extends StatelessWidget {
  final List<String> images = [
    'assets/images/pro.jpg',
    'assets/images/pro.jpg',
    'assets/images/pro.jpg',
    'assets/images/pro.jpg',
    'assets/images/pro.jpg',
  ];

  CustomListViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 17,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showImageDialog(context, index),
            child: Hero(
              tag: 'image_$index',
              child: AspectRatio(
                aspectRatio: 3.7 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.defaultSize! * 1.6)),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(images[index])),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: SizeConfig.defaultSize! * 1);
        },
        itemCount: images.length,
      ),
    );
  }

  void _showImageDialog(BuildContext context, int initialIndex) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return StatefulBuilder(
        builder: (context, setState) {
          final PageController pageController =
              PageController(initialPage: initialIndex);
          Timer? timer;

          timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
            if (pageController.page == images.length - 1) {
              pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn,
              );
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn,
              );
            }
          });

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: GestureDetector(
              onTap: () {
                timer?.cancel();
                Navigator.pop(context);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeConfig.defaultSize! * 1.6)),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(images[initialIndex])),
                      ),
                    ).blurred(
                      blur: 10,
                      colorOpacity: 0.5,
                    ),
                  ),
                  PageView.builder(
                    controller: pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          timer?.cancel();
                          GoRouter.of(context).pop();
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.all(SizeConfig.defaultSize! * .8),
                          child: Hero(
                            tag: 'image_$index',
                            child: InteractiveViewer(
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        initialIndex = index;
                      });
                    },
                  ),
                  Positioned(
                    bottom: SizeConfig.defaultSize! * 25,
                    child: DotsIndicator(
                      dotsCount: images.length,
                      position: initialIndex.toInt(),
                      decorator: DotsDecorator(
                        activeColor: Colors.white,
                        size: Size.square(SizeConfig.defaultSize! * .9),
                        activeSize: Size(SizeConfig.defaultSize! * 1.8,
                            SizeConfig.defaultSize! * .9),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.defaultSize! * .5),
                        ),
                      ),
                    ),
                  ),
],
              ),
            ),
          );
        },
      );
    },
  );
}
}



  // void _showImageDialog(BuildContext context, int initialIndex) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     barrierColor: Colors.black.withOpacity(0.5),
  //     transitionDuration: const Duration(milliseconds: 300),
  //     pageBuilder: (BuildContext buildContext, Animation animation,
  //         Animation secondaryAnimation) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return Scaffold(
  //             backgroundColor: Colors.transparent,
  //             body: GestureDetector(
  //               onTap: () => Navigator.pop(context),
  //               child: Stack(
  //                 alignment: Alignment.center,
  //                 children: [
  //                   Positioned.fill(
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.all(
  //                             Radius.circular(SizeConfig.defaultSize! * 1.6)),
  //                         image: DecorationImage(
  //                             fit: BoxFit.contain,
  //                             image: AssetImage(images[initialIndex])),
  //                       ),
  //                     ).blurred(
  //                       blur: 10,
  //                       colorOpacity: 0.5,
  //                     ),
  //                   ),
  //                   PageView.builder(
  //                     controller: PageController(initialPage: initialIndex),
  //                     itemCount: images.length,
  //                     itemBuilder: (context, index) {
  //                       return GestureDetector(
  //                         onTap: () {
  //                           GoRouter.of(context).pop();
  //                         },
  //                         child: Padding(
  //                           padding:
  //                               EdgeInsets.all(SizeConfig.defaultSize! * .8),
  //                           child: Hero(
  //                             tag: 'image_$index',
  //                             child: InteractiveViewer(
  //                               child: Image.asset(
  //                                 images[index],
  //                                 fit: BoxFit.contain,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                     onPageChanged: (index) {
  //                       setState(() {
  //                         initialIndex = index;
  //                       });
  //                     },
  //                   ),
  //                   Positioned(
  //                     bottom: SizeConfig.defaultSize! * 25,
  //                     child: DotsIndicator(
  //                       dotsCount: images.length,
  //                       position: initialIndex.toInt(),
  //                       decorator: DotsDecorator(
  //                         activeColor: Colors.white,
  //                         size: Size.square(SizeConfig.defaultSize! * .9),
  //                         activeSize: Size(SizeConfig.defaultSize! * 1.8,
  //                             SizeConfig.defaultSize! * .9),
  //                         activeShape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(
  //                               SizeConfig.defaultSize! * .5),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

