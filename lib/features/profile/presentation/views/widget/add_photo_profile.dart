import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoProfile extends StatefulWidget {
  const AddPhotoProfile({super.key});

  @override
  State<AddPhotoProfile> createState() => _AddPhotoProfileState();
}

class _AddPhotoProfileState extends State<AddPhotoProfile> {
  File? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: image != null
                ? Image.file(
                    image!,
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  )
                : CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 240, 225, 180),
                    maxRadius: SizeConfig.defaultSize! * 8,
                  ),
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
                      color: Colors.white)),
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 5.2,
                            margin: EdgeInsets.only(
                                top: SizeConfig.defaultSize! * 1),
                            padding:
                                EdgeInsets.all(SizeConfig.defaultSize! * 1.5),
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
                                    pickImage(ImageSource.gallery);
                                  },
                                )),
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
                                    pickImage(ImageSource.camera);
                                  },
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.add_a_photo_rounded,
                    size: SizeConfig.defaultSize! * 2.5,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
