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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSubTitleMedium(
                  text: "أحمد مراد",
                ),
                VirticalSpace(.5),
                CustomBody(
                  text: "مطور تطبيقات موبايل",
                ),
                VirticalSpace(0.2),
                Row(
                  children: [
                    CustomLabel(
                      text: "4.6",
                      color: Colors.black,
                    ),
                    HorizintalSpace(0.5),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
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
                  size: 25,
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
              bottom: 450,
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
                // backgroundDecoration: const BoxDecoration(
                //   color: Colors.transparent,
                // ),
                pageController: _pageController,
                enableRotation: true,
                onPageChanged: (index) {
                  setState(() {});
                },
              ),
            ),
            Positioned(
              top: 25,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              top: 340,
              left: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green),
                child: IconButton(
                  icon: const Icon(
                    Icons.chat,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const Positioned(
              top: 320,
              right: 30,
              child: Center(
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
              top: 20,
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
                      height: 3,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    dotDecoration: DotDecoration(
                      width: MediaQuery.of(context).size.width /
                          (imageUrls.length + 1),
                      height: 3,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    spacing: 5,
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
