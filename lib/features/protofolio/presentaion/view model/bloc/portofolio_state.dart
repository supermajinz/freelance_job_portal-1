part of 'portofolio_bloc.dart';

abstract class PortofolioState extends Equatable {
  const PortofolioState();

  @override
  List<Object> get props => [];
}

class PortofolioInitial extends PortofolioState {}

class PortofolioLoading extends PortofolioState {}

class PortofolioLoaded extends PortofolioState {
  final List<PortofolioJob> portofolios;

  const PortofolioLoaded({required this.portofolios});

  @override
  List<Object> get props => [portofolios];
}

class PortofolioError extends PortofolioState {
  final String message;

  const PortofolioError({required this.message});

  @override
  List<Object> get props => [message];
}

class IsPortofolioJobLikedState extends PortofolioState {
  final bool isLiked;

  const IsPortofolioJobLikedState({required this.isLiked});

  @override
  List<Object> get props => [isLiked];
}

class PortofolioEdited extends PortofolioState {}

class PortofolioJobDeleted extends PortofolioState {}
