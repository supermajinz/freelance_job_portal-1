import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:photo_view/photo_view.dart';

// Updated Image Gallery Viewer
class ImageGalleryViewer extends StatelessWidget {
  final List<String> imageUrls;
  const ImageGalleryViewer({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 18,
      child: imageUrls.isNotEmpty
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildImageCard(context, imageUrls[index], imageUrls);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 8.0);
              },
              itemCount: imageUrls.length,
            )
          : const Center(
              child: Text("No images to display"),
            ),
    );
  }

  Widget _buildImageCard(
      BuildContext context, String imageUrl, List<String> allImageUrls) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PortofolioImageGalleryScreen(imageUrls: allImageUrls),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 3.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.defaultSize! * 1.6)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "${DependencyInjection.baseUrl}file/photo/${imageUrl}"),
            ),
          ),
        ),
      ),
    );
  }
}

// Modified Image Gallery Screen
class PortofolioImageGalleryScreen extends StatefulWidget {
  final List<String> imageUrls;
  const PortofolioImageGalleryScreen({super.key, required this.imageUrls});

  @override
  // ignore: library_private_types_in_public_api
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<PortofolioImageGalleryScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                itemCount: widget.imageUrls.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Toggle app bar visibility if needed
                    },
                    child: PhotoView(
                      imageProvider: NetworkImage(
                          "${DependencyInjection.baseUrl}file/photo/${widget.imageUrls[index]}"),
                      heroAttributes: PhotoViewHeroAttributes(
                          tag: 'portfolioImage${widget.imageUrls[index]}'),
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
                children: widget.imageUrls.map((imageUrl) {
                  final index = widget.imageUrls.indexOf(imageUrl);
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
