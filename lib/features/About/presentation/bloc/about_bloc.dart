import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/features/About/presentation/bloc/about_event.dart';
import 'package:portfolio_in/features/About/presentation/bloc/about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutState());
}
