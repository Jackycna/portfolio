import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/features/Skills/presentation/bloc/skills_explanation/skill_explanation_event.dart';
import 'package:portfolio_in/features/Skills/presentation/bloc/skills_explanation/skill_explanation_state.dart';

class SkillExplanationBloc
    extends Bloc<SkillExplanationEvent, SkillExplanationState> {
  SkillExplanationBloc() : super(SkillExplanationState(index: 10)) {
    on<SkillTextHover>(
      (event, emit) => emit(SkillExplanationState(index: event.index)),
    );
  }
}
