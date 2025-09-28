abstract class HomescreenEvent {}

final class HoverContent extends HomescreenEvent {
  final int content;
  HoverContent({required this.content});
}

final class LaunchUrl extends HomescreenEvent {
  final String url;
  LaunchUrl({required this.url});
}

final class CallEvent extends HomescreenEvent {}

final class SendEmail extends HomescreenEvent {}

final class DownloadCV extends HomescreenEvent {}
