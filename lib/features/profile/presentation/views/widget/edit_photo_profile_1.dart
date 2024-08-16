import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/photo/bloc/image_bloc.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/photo_dt_o.dart';
import 'package:image_picker/image_picker.dart';

class EditPhotoProfile extends StatefulWidget {
  final Function(int) onPhotoUploaded;
  final PhotoDtO? selectedPhoto;
  const EditPhotoProfile(
      {super.key, required this.onPhotoUploaded, this.selectedPhoto});

  @override
  _EditPhotoProfileState createState() => _EditPhotoProfileState();
}

class _EditPhotoProfileState extends State<EditPhotoProfile> {
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
                    onPressed: () {
                      //Navigator.pop(context);
                      pickImage(ImageSource.gallery);},
                    icon: Icon(
                      Icons.edit_outlined,
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
        child: widget.selectedPhoto != null
            ? Image.network(
                "${DependencyInjection.baseUrl}file/photo/${widget.selectedPhoto!.photo}",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return Icon(
                    Icons.error,
                    size: SizeConfig.defaultSize! * 10,
                    color: Colors.red,
                  );
                },
              )
            : Icon(
                Icons.person,
                size: SizeConfig.defaultSize! * 10,
                color: Colors.grey[600],
              ),
      );
    }
  }
}
