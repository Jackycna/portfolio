import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/core/url_launcher/open_url.dart';
import 'package:portfolio_in/features/homescreen/presentation/blocs/homescree_state.dart';
import 'package:portfolio_in/features/homescreen/presentation/blocs/homescreen_event.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreeState> {
  final OpenUrl repo;
  HomescreenBloc(this.repo) : super(HomescreeState(content: 10)) {
    on<HoverContent>((event, emit) {
      emit(HomescreeState(content: event.content));
    });
    on<LaunchUrl>((event, emit) async {
      await repo.loadUrl(event.url);
    });
    on<CallEvent>((event, emit) async {
      await repo.makecall();
    });
    on<SendEmail>((event, emit) async => await repo.mailto());
    on<DownloadCV>((event, emit) async => await repo.dounload());
  }
}
