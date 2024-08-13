import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/photo/bloc/image_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageGalleryWidget extends StatefulWidget {
  final Function(int) onPhotoUploaded;
  const ImageGalleryWidget({Key? key, required this.onPhotoUploaded})
      : super(key: key);

  @override
  _ImageGalleryWidgetState createState() => _ImageGalleryWidgetState();
}

class _ImageGalleryWidgetState extends State<ImageGalleryWidget> {
  late ImageBloc _imageBloc;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    _imageBloc = context.read<ImageBloc>();
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      print('Image picked: ${image.path}');
      _imageBloc.add(UploadImage(imagePath: image.path));
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageBloc, ImageState>(
      listener: (context, state) {
        if (state is ImageUploaded) {
          setState(() {
            imageUrls.add(state.imageUrl);
          });
          widget.onPhotoUploaded(state.photoId);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.add_a_photo,
                size: SizeConfig.defaultSize! * 4,
                color: Colors.blue,
              ),
              onPressed: () => _showImageSourceBottomSheet(context),
            ),
            SizedBox(height: SizeConfig.defaultSize! * 2),
            _buildImageGallery(context),
          ],
        );
      },
    );
  }

  Widget _buildImageGallery(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 18,
      child: imageUrls.isNotEmpty
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildImageCard(imageUrls[index], index);
              },
              separatorBuilder: (context, index) {
                return const HorizintalSpace(1);
              },
              itemCount: imageUrls.length,
            )
          : const Center(
              child: Text("You don't have photos in your profile"),
            ),
    );
  }

  Widget _buildImageCard(String imageUrl, int index) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
          aspectRatio: 3.7 / 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.defaultSize! * 1.6)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: imageUrl.startsWith('http')
                    ? NetworkImage(imageUrl) as ImageProvider
                    : FileImage(File(imageUrl)),
              ),
            ),
          ),
        ),
        Positioned(
          top: SizeConfig.defaultSize! * 0.5,
          right: SizeConfig.defaultSize! * 0.5,
          child: IconButton(
            onPressed: () => _deleteImage(index),
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: SizeConfig.defaultSize! * 2.5,
            ),
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 0.5,
          right: SizeConfig.defaultSize! * 0.5,
          child: IconButton(
            onPressed: () {
              // Add edit functionality here
            },
            icon: Icon(
              Icons.edit,
              color: Colors.blue,
              size: SizeConfig.defaultSize! * 2.5,
            ),
          ),
        )
      ],
    );
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: EdgeInsets.only(top: SizeConfig.defaultSize! * 1),
            padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Icon(Icons.image,
                            size: SizeConfig.defaultSize! * 6,
                            color: Colors.green),
                        const VirticalSpace(1.2),
                        Text(
                          "Gallery",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.green),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.gallery);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt,
                            size: SizeConfig.defaultSize! * 6,
                            color: Colors.green),
                        const VirticalSpace(1.2),
                        Text(
                          "Camera",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.green),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.camera);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteImage(int index) {
    setState(() {
      imageUrls.removeAt(index);
    });
    // You might want to add logic here to delete the image from the server as well
  }
}
