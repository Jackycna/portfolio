import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/features/Skills/presentation/bloc/skills_event.dart';
import 'package:portfolio_in/features/Skills/presentation/bloc/skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc() : super(SkillsState(index: 10)) {
    on<ChangeHoverContent>(
      (event, emit) => emit(SkillsState(index: event.index)),
    );
  }
}
