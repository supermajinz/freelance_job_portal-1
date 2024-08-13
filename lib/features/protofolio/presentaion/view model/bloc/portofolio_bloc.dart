import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/portofolio_job.dart';
import 'package:freelance_job_portal/features/protofolio/data/repo/portofolio_repo.dart';

part 'portofolio_event.dart';
part 'portofolio_state.dart';

class PortofolioBloc extends Bloc<PortofolioEvent, PortofolioState> {
  final PortofolioRepo _portofolioRepo;

  PortofolioBloc({required PortofolioRepo portofolioRepo})
      : _portofolioRepo = portofolioRepo,
        super(PortofolioInitial()) {
    on<GetPortofolios>(_onGetPortofolios);
    on<CreatePortofolioJob>(_onCreatePortofolioJob);
    on<EditPortofolioJob>(_onEditPortofolioJob);
    on<DeletePortofolioJob>(_onDeletePortofolioJob);
    on<LikePortofolioJob>(_onLikePortofolioJob);
    on<ViewPortofolioJob>(_onViewPortofolioJob);
    on<IsPortofolioJobLiked>(_onIsPortofolioJobLiked);
  }

  Future<void> _onGetPortofolios(
      GetPortofolios event, Emitter<PortofolioState> emit) async {
    emit(PortofolioLoading());
    final Either<Failure, List<PortofolioJob>> failureOrPortofolios =
        await _portofolioRepo.getPortofolios(event.workerProfileId);
    emit(failureOrPortofolios.fold(
      (failure) {
        print(failure.errMessage);
        return PortofolioError(message: failure.errMessage);
      },
      (portofolios) {
        print(portofolios);
        if (portofolios.isEmpty) {
          emit(NoPortofolios());
        }
        return PortofolioLoaded(portofolios: portofolios);
      },
    ));
  }

  Future<void> _onCreatePortofolioJob(
      CreatePortofolioJob event, Emitter<PortofolioState> emit) async {
    emit(PortofolioLoading());
    final Either<Failure, PortofolioJob> failureOrPortofolioJob =
        await _portofolioRepo.createPortofolioJob(event.jobData);

    emit(failureOrPortofolioJob.fold(
      (failure) => PortofolioError(message: failure.errMessage),
      (portofolioJob) {
        // Accessing the current state within the fold closure
        final currentState = state;

        // Updating the state based on its type
        if (currentState is PortofolioLoaded) {
          final updatedPortofolios =
              List<PortofolioJob>.from(currentState.portofolios)
                ..add(portofolioJob);
          return PortofolioLoaded(portofolios: updatedPortofolios);
        } else {
          return PortofolioLoaded(portofolios: [portofolioJob]);
        }
      },
    ));
  }

  Future<void> _onEditPortofolioJob(
      EditPortofolioJob event, Emitter<PortofolioState> emit) async {
    emit(PortofolioLoading());
    final result =
        await _portofolioRepo.editPortofolioJob(event.jobData, event.jobId);
    result.fold((failure) => emit(PortofolioError(message: failure.errMessage)),
        (job) {
      emit(PortofolioEdited());
    });
    /*
    final Either<Failure, PortofolioJob> failureOrPortofolioJob =
        await _portofolioRepo.editPortofolioJob(event.jobData, event.jobId);
    print('editPort $failureOrPortofolioJob');
    emit(failureOrPortofolioJob.fold(
      (failure) => PortofolioError(message: failure.errMessage),
      (updatedJob) {
        final currentState = state;
        if (currentState is PortofolioLoaded) {
          final updatedPortofolios = currentState.portofolios.map((job) {
            return job.id == updatedJob.id ? updatedJob : job;
          }).toList();
          return PortofolioLoaded(portofolios: updatedPortofolios);
        } else {
          // Handle the case where the state is not PortofolioLoaded
          // You might want to return an error state or a default state
          return PortofolioError(message: 'Error updating job');
        }
      },
    ));
    */
  }

  Future<void> _onDeletePortofolioJob(
      DeletePortofolioJob event, Emitter<PortofolioState> emit) async {
    emit(PortofolioLoading());
    final result = await _portofolioRepo.deletePortofolioJob(event.jobId);
    result.fold((failure) => emit(PortofolioError(message: failure.errMessage)),
        (_) => emit(PortofolioJobDeleted()));
    /*
    final Either<Failure, void> failureOrSuccess =
        await _portofolioRepo.deletePortofolioJob(event.jobId);

    emit(failureOrSuccess.fold(
      (failure) => PortofolioError(message: failure.errMessage),
      (_) {
        final currentState = state;
        if (currentState is PortofolioLoaded) {
          final updatedPortofolios = currentState.portofolios
              .where((job) => job.id != event.jobId)
              .toList();
          return PortofolioLoaded(portofolios: updatedPortofolios);
        } else {
          // Handle the case where the state is not PortofolioLoaded
          return PortofolioError(message: 'Error deleting job');
        }
      },
    ));
    */
  }

  Future<void> _onLikePortofolioJob(
      LikePortofolioJob event, Emitter<PortofolioState> emit) async {
    emit(PortofolioLoading());
    final Either<Failure, Map<String, dynamic>> failureOrResponse =
        await _portofolioRepo.like(event.jobId);

    emit(failureOrResponse.fold(
      (failure) => PortofolioError(message: failure.errMessage),
      (response) {
        final currentState = state;
        if (currentState is PortofolioLoaded) {
          final updatedPortofolios = currentState.portofolios.map((job) {
            // Assuming your API returns the updated like count in the response
            final int updatedLikeCount = response['likeCount'] ?? job.likeNo;
            return job.id == event.jobId
                ? job.copyWith(likeNo: updatedLikeCount)
                : job;
          }).toList();
          return PortofolioLoaded(portofolios: updatedPortofolios);
        } else {
          // Handle the case where the state is not PortofolioLoaded
          return PortofolioError(message: 'Error updating like count');
        }
      },
    ));
  }

  Future<void> _onViewPortofolioJob(
      ViewPortofolioJob event, Emitter<PortofolioState> emit) async {
    emit(PortofolioLoading());
    final Either<Failure, Map<String, dynamic>> failureOrResponse =
        await _portofolioRepo.view(event.jobId);

    emit(failureOrResponse.fold(
      (failure) => PortofolioError(message: failure.errMessage),
      (response) {
        final currentState = state;
        if (currentState is PortofolioLoaded) {
          final updatedPortofolios = currentState.portofolios.map((job) {
            // Assuming your API returns the updated view count in the response
            final int updatedViewCount = response['viewCount'] ?? job.viewsNo;
            return job.id == event.jobId
                ? job.copyWith(viewsNo: updatedViewCount)
                : job;
          }).toList();
          return PortofolioLoaded(portofolios: updatedPortofolios);
        } else {
          // Handle the case where the state is not PortofolioLoaded
          return PortofolioError(message: 'Error updating view count');
        }
      },
    ));
  }

  Future<void> _onIsPortofolioJobLiked(
      IsPortofolioJobLiked event, Emitter<PortofolioState> emit) async {
    emit(PortofolioLoading());
    final Either<Failure, bool> failureOrIsLiked =
        await _portofolioRepo.isLiked(event.jobId);

    emit(failureOrIsLiked.fold(
      (failure) => PortofolioError(message: failure.errMessage),
      (isLiked) => IsPortofolioJobLikedState(isLiked: isLiked),
    ));
  }
}
