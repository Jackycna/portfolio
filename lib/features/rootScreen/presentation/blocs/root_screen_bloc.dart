import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/features/rootScreen/data/root_screen_data_source.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/root_screen_event.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/rootscreen_state.dart';

class RootScreenBloc extends Bloc<RootScreenEvent, RootscreenState> {
  RootScreenBloc()
    : super(
        RootscreenState(
          button: Buttons.home,
          index: 0,
          currentPage: RootScreenDataSource.screens[0],
        ),
      ) {
    on<ChangeButton>((event, emit) {
      emit(state.copyWith(button: event.button));
    });
    on<ChangeIndex>(
      (event, emit) => emit(
        state.copyWith(
          index: event.index,
          currentPage: RootScreenDataSource.screens[event.index],
        ),
      ),
    );
  }
}
