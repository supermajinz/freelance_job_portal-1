import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_project_event.dart';
part 'my_project_state.dart';

class MyProjectBloc extends Bloc<MyProjectEvent, MyProjectState> {
  MyProjectBloc() : super(MyProjectInitial()) {
    on<MyProjectEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
