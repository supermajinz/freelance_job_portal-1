part of 'report_bloc.dart';

sealed class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

final class ReportInitial extends ReportState {}

final class ReportLoading extends ReportState {}

final class ReportSuccess extends ReportState {
  final ReportModel reportModel;

  const ReportSuccess(this.reportModel);
}

final class ReportFaliure extends ReportState {
  final String errMessage;

  const ReportFaliure(this.errMessage);
}
