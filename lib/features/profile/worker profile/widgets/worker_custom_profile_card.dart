import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import '../../../../core/utils/functions/utils.dart';

class WorkerCustomProfileCard extends StatelessWidget {
  final WorkerProfile profile;
  final IconData? icon;
  final void Function()? onPressed;

  const WorkerCustomProfileCard({
    super.key,
    required this.profile,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final workerName =
        '${profile.userDto!.firstname ?? 'Unknown'} ${profile.userDto!.lastname ?? ''}';
    final workerPhotoUrl = profile.photoDtOs?.isNotEmpty == true
        ? "${DependencyInjection.baseUrl}file/photo/${profile.photoDtOs![0].photo}"
        : null;
    final backgroundColor =
        workerPhotoUrl == null ? Utils.getBackgroundColor(workerName) : null;

    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * .8),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.defaultSize! * 1.5))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Hero(
                tag: 'profileImage',
                child: CircleAvatar(
                    radius: SizeConfig.defaultSize! * 5,
                    backgroundColor: backgroundColor,
                    backgroundImage: workerPhotoUrl != null
                        ? NetworkImage(workerPhotoUrl)
                        : null,
                    child: workerPhotoUrl == null
                        ? Center(
                            child: Text(
                              Utils.getInitials(workerName),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),
                          )
                        : null),
              ),
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
            Column(
              children: [
                const CustomLabel(
                  text: 'فريلانسر',
                  color: Colors.black,
                ),
                IconButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .push('/editWorkerProfile', extra: profile);
                    },
                    icon: Icon(
                      icon,
                      size: SizeConfig.defaultSize! * 2.5,
                      color: Colors.black,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Image Gallery Screen for WorkerProfile
class ImageGalleryScreen extends StatefulWidget {
  final WorkerProfile profile;
  const ImageGalleryScreen({super.key, required this.profile});

  @override
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0; // To track the current image index

  @override
  void initState() {
    super.initState();
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
                      heroAttributes: PhotoViewHeroAttributes(
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
