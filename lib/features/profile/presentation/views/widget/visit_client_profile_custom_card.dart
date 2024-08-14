// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/client_profile.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import '../../../../../core/utils/functions/utils.dart';
import '../../../../../core/widget/bookmark_button.dart';

class VisitCustomProfileCard extends StatelessWidget {
  final ClientProfile profile;

  final IconData? icon;
  final void Function()? onPressed;
  const VisitCustomProfileCard({
    super.key,
    required this.profile,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final clientName =
        '${profile.userDto!.firstname ?? 'Unknown'} ${profile.userDto!.lastname ?? ''}';
    final clientPhotoUrl = profile.photoDtOs?.isNotEmpty == true
        ? "${DependencyInjection.baseUrl}file/photo/${profile.photoDtOs![0].photo}"
        : null;
    final backgroundColor =
        clientPhotoUrl == null ? Utils.getBackgroundColor(clientName) : null;
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
                profile.photoDtOs!.isNotEmpty
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageGalleryScreen(
                            profile: profile,
                          ),
                        ),
                      )
                    : null;
              },
              child: CircleAvatar(
                  radius: SizeConfig.defaultSize! * 5,
                  backgroundColor: backgroundColor,
                  backgroundImage: clientPhotoUrl != null
                      ? NetworkImage(clientPhotoUrl)
                      : null,
                  child: clientPhotoUrl == null
                      ? Center(
                          child: Text(
                            Utils.getInitials(clientName),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        )
                      : null),
            ),
            const HorizintalSpace(1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSubTitleMedium(
                  text:
                      "${profile.userDto!.firstname} ${profile.userDto!.lastname}",
                ),
                const VirticalSpace(.5),
                CustomBody(
                  text: profile.jobTitleDto!.title!,
                ),
                const VirticalSpace(0.2),
                Row(
                  children: [
                    CustomLabel(
                      text: "${profile.rate}",
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
            const Spacer(),
            Row(
              children: [
                BookmarkButton(isProject: false, id: profile.userId!),

                // CustomLabel(
                //   text: 'عميل',
                //   color: Colors.black,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
/*
class ImageGalleryScreen extends StatefulWidget {
  final ClientProfile profile;
  const ImageGalleryScreen({super.key, required this.profile});

  @override
  // ignore: library_private_types_in_public_api
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls =
        widget.profile.photoDtOs!.map((e) => e.photo!).toList();
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
                    imageProvider: NetworkImage(
                        "http://localhost:8080/api/v1/file/photo/${imageUrls[index]}"),
                    minScale: PhotoViewComputedScale.covered,
                    maxScale: PhotoViewComputedScale.covered *
                        SizeConfig.defaultSize! *
                        .15,
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
              right: SizeConfig.defaultSize! * 3,
              child: const Center(
                child: CustomTitle(
                  text: 'أحمد مراد',
                  white: true,
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
*/

class ImageGalleryScreen extends StatefulWidget {
  final ClientProfile profile;
  const ImageGalleryScreen({super.key, required this.profile});

  @override
  // ignore: library_private_types_in_public_api
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0; // To track the current image index

  @override
  void initState() {
    super.initState();
    // Initialize _currentIndex if needed
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls =
        widget.profile.photoDtOs!.map((e) => e.photo!).toList();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                itemCount: imageUrls.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Toggle the app bar visibility
                      // You might need to manage the app bar visibility state
                      // in your parent widget or using a global state management
                      // solution like Provider or BLoC.
                    },
                    child: PhotoView(
                      imageProvider: NetworkImage(
                          "${DependencyInjection.baseUrl}file/photo/${imageUrls[index]}"),
                      heroAttributes: const PhotoViewHeroAttributes(
                          tag:
                              'profileImage'), // Use the same tag as the profile image
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 16.0,
              left: 16.0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageUrls.map((imageUrl) {
                  final index = imageUrls.indexOf(imageUrl);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == index ? Colors.white : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
