import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/photo/photo_repo_impl.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final PhotoRepoImpl _imageRepository;

  ImageBloc(this._imageRepository) : super(ImageInitial()) {
    on<UploadImage>(_onUploadImage);
    on<ClearImage>(_onClearImage);
  }

  Future<void> _onUploadImage(
      UploadImage event, Emitter<ImageState> emit) async {
    emit(ImageUploading());
    print('bloc1');
    final result = await _imageRepository.uploadPhoto(event.imagePath);
    result.fold(
      (failure) => emit(ImageError(failure.errMessage)),
      (imageModel) {
        final imageUrl = _imageRepository.getImageUrl(imageModel.photo);
        print('bloc $imageUrl');
        emit(ImageUploaded(imageUrl, imageModel.id));
      },
    );
  }

  void _onClearImage(ClearImage event, Emitter<ImageState> emit) {
    emit(ImageInitial());
  }
}
