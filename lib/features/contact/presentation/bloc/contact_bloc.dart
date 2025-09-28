import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/features/contact/presentation/bloc/contact_state.dart';
import 'package:portfolio_in/features/contact/presentation/bloc/contatct_event.dart';

class ContactBloc extends Bloc<ContatctEvent, ContactState> {
  ContactBloc() : super(ContactState());
}
