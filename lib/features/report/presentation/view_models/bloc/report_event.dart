part of 'report_bloc.dart';

sealed class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class AddReport extends ReportEvent {
  final Map<String, dynamic> reportData;

  const AddReport(this.reportData);
}
