import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({super.key, this.icon, this.onPressed});

  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * .8),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.defaultSize! * 1.5))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageGalleryScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: SizeConfig.defaultSize! * 5,
                backgroundImage: const AssetImage(
                  "assets/images/pro.jpg",
                ),
              ),
            ),
            const HorizintalSpace(1),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSubTitleMedium(
                  text: "أحمد مراد",
                ),
                const VirticalSpace(.5),
                const CustomBody(
                  text: "مطور تطبيقات موبايل",
                ),
                const VirticalSpace(0.2),
                Row(
                  children: [
                    const CustomLabel(
                      text: "4.6",
                      color: Colors.black,
                    ),
                    const HorizintalSpace(0.5),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: SizeConfig.defaultSize! * 2,
                    )
                  ],
                )
              ],
            ),
            const HorizintalSpace(7),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  size: SizeConfig.defaultSize! * 2.5,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}

class ImageGalleryScreen extends StatefulWidget {
  const ImageGalleryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  final List<String> imageUrls = [
    'assets/images/pro.jpg',
    'assets/images/pro1.jpg',
    'assets/images/pro2.jpg',
    'assets/images/pro.jpg',
    'assets/images/pro.jpg',
    'assets/images/pro1.jpg',
    'assets/images/pro2.jpg',
    'assets/images/pro.jpg',
  ];

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية شاشة
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              bottom: SizeConfig.defaultSize! * 45,
              child: PhotoViewGallery.builder(
                itemCount: imageUrls.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imageUrls[index]),
                    minScale: PhotoViewComputedScale.covered,
                    maxScale: PhotoViewComputedScale.covered * 1.5,
                    heroAttributes:
                        PhotoViewHeroAttributes(tag: imageUrls[index]),
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                pageController: _pageController,
                enableRotation: true,
                onPageChanged: (index) {
                  setState(() {});
                },
              ),
            ),
            Positioned(
              top: SizeConfig.defaultSize! * 2.5,
              right: SizeConfig.defaultSize! * 1,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              top: SizeConfig.defaultSize! * 35,
              left: SizeConfig.defaultSize! * 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultSize! * 5),
                    color: Colors.green),
                child: IconButton(
                  icon: Icon(
                    Icons.chat,
                    color: Colors.white,
                    size: SizeConfig.defaultSize! * 2.5,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.defaultSize! * 32,
              right: 30,
              child: const Center(
                child: Text(
                  'أحمد مراد',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.defaultSize! * 2,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: imageUrls.length,
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                      width: MediaQuery.of(context).size.width /
                          (imageUrls.length + 1),
                      height: SizeConfig.defaultSize! * .3,
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 2.4),
                    ),
                    dotDecoration: DotDecoration(
                      width: MediaQuery.of(context).size.width /
                          (imageUrls.length + 1),
                      height: SizeConfig.defaultSize! * .3,
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 1.6),
                    ),
                    spacing: SizeConfig.defaultSize! * .5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
