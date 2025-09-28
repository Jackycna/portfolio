abstract class ProjectsEvent {}

final class ChangeProject extends ProjectsEvent {
  final int index;
  ChangeProject({required this.index});
}
