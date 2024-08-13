part of 'portofolio_bloc.dart';

abstract class PortofolioEvent extends Equatable {
  const PortofolioEvent();

  @override
  List<Object> get props => [];
}

class GetPortofolios extends PortofolioEvent {
  final int workerProfileId;

  const GetPortofolios({required this.workerProfileId});

  @override
  List<Object> get props => [workerProfileId];
}

class CreatePortofolioJob extends PortofolioEvent {
  final Map<String, dynamic> jobData;

  const CreatePortofolioJob({required this.jobData});

  @override
  List<Object> get props => [jobData];
}

class EditPortofolioJob extends PortofolioEvent {
  final Map<String, dynamic> jobData;
  final int jobId;

  const EditPortofolioJob({required this.jobData, required this.jobId});

  @override
  List<Object> get props => [jobData, jobId];
}

class DeletePortofolioJob extends PortofolioEvent {
  final int jobId;

  const DeletePortofolioJob({required this.jobId});

  @override
  List<Object> get props => [jobId];
}

class LikePortofolioJob extends PortofolioEvent {
  final int jobId;

  const LikePortofolioJob({required this.jobId});

  @override
  List<Object> get props => [jobId];
}

class ViewPortofolioJob extends PortofolioEvent {
  final int jobId;

  const ViewPortofolioJob({required this.jobId});

  @override
  List<Object> get props => [jobId];
}

class IsPortofolioJobLiked extends PortofolioEvent {
  final int jobId;

  const IsPortofolioJobLiked({required this.jobId});

  @override
  List<Object> get props => [jobId];
}

class NoPortofolios extends PortofolioState {}
