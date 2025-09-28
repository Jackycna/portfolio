enum Buttons { home, skills, about, projects, others }

abstract class RootScreenEvent {}

final class ChangeButton extends RootScreenEvent {
  final Buttons button;
  ChangeButton({required this.button});
}

final class ChangeIndex extends RootScreenEvent {
  final int index;
  ChangeIndex({required this.index});
}
