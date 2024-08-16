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
              onPressed: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
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

  void _deleteImage(int index) {
    setState(() {
      imageUrls.removeAt(index);
    });
    // You might want to add logic here to delete the image from the server as well
  }
}
