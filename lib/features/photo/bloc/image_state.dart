part of 'image_bloc.dart';

sealed class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

final class ImageInitial extends ImageState {}

class ImageUploading extends ImageState {}

class ImageUploaded extends ImageState {
  final String imageUrl;
  final int photoId;

  const ImageUploaded(this.imageUrl, this.photoId);

  @override
  List<Object> get props => [imageUrl];
}

class ImageError extends ImageState {
  final String message;

  const ImageError(this.message);

  @override
  List<Object> get props => [message];
}
