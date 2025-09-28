import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/features/Projects/presentation/bloc/project_state.dart';
import 'package:portfolio_in/features/Projects/presentation/bloc/projects_event.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectState> {
  ProjectsBloc() : super(ProjectState(index: 10)) {
    on<ChangeProject>((event, emit) => emit(ProjectState(index: event.index)));
  }
}
