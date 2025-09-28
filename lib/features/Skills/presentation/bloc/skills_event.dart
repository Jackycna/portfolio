abstract class SkillsEvent {}

final class ChangeHoverContent extends SkillsEvent {
  final int index;
  ChangeHoverContent({required this.index});
}
