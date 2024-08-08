// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_bloc.dart';

sealed class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends ImageEvent {
  final String imagePath;

  const UploadImage({required this.imagePath});
  

  @override
  List<Object> get props => [imagePath];
}

class ClearImage extends ImageEvent {}
