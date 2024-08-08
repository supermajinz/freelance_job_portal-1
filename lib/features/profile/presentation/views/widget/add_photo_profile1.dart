import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/photo/bloc/image_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoProfile extends StatefulWidget {
  final Function(int) onPhotoUploaded;
  const AddPhotoProfile({super.key, required this.onPhotoUploaded});

  @override
  _AddPhotoProfileState createState() => _AddPhotoProfileState();
}

class _AddPhotoProfileState extends State<AddPhotoProfile> {
  late ImageBloc _imageBloc;

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
          widget.onPhotoUploaded(state.photoId);
        }
      },
      builder: (context, state) {
        return Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClipOval(
                child: _buildImageContent(context, state),
              ),
              Positioned(
                top: SizeConfig.defaultSize! * 10,
                left: SizeConfig.defaultSize! * 11,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultSize! * 3),
                    border: Border.all(
                      width: SizeConfig.defaultSize! * .4,
                      color: Colors.white,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () => _showImageSourceBottomSheet(context),
                    icon: Icon(
                      Icons.add_a_photo_rounded,
                      size: SizeConfig.defaultSize! * 2.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageContent(BuildContext context, ImageState state) {
    if (state is ImageUploaded) {
      if (state.imageUrl.startsWith('http')) {
        // Network image
        return Image.network(
          state.imageUrl,
          width: SizeConfig.defaultSize! * 14,
          height: SizeConfig.defaultSize! * 14,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            print('Error loading image: $error');
            return Icon(
              Icons.error,
              size: SizeConfig.defaultSize! * 10,
              color: Colors.red,
            );
          },
        );
      } else {
        // Local file
        return Image.file(
          File(state.imageUrl),
          width: SizeConfig.defaultSize! * 14,
          height: SizeConfig.defaultSize! * 14,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading image: $error');
            return Icon(
              Icons.error,
              size: SizeConfig.defaultSize! * 10,
              color: Colors.red,
            );
          },
        );
      }
    } else {
      return Container(
        width: SizeConfig.defaultSize! * 14,
        height: SizeConfig.defaultSize! * 14,
        color: Colors.grey[300],
        child: Icon(
          Icons.person,
          size: SizeConfig.defaultSize! * 10,
          color: Colors.grey[600],
        ),
      );
    }
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
}
