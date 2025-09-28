abstract class SkillExplanationEvent {}

final class SkillTextHover extends SkillExplanationEvent {
  final int index;
  SkillTextHover({required this.index});
}
