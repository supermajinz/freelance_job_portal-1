import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/report/data/repo/report_repo.dart';

import '../../../data/model/report_model.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepo repo;
  ReportBloc(this.repo) : super(ReportInitial()) {
    on<AddReport>(_onAddReview);
  }
  Future<void> _onAddReview(AddReport event, Emitter<ReportState> emit) async {
    emit(ReportLoading());
    final result = await repo.addReport(event.reportData);
    result.fold(
      (failure) => emit(ReportFaliure(failure.errMessage)),
      (report) => emit(ReportSuccess(report)),
    );
  }
}
