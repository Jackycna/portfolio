import 'package:get_it/get_it.dart';
import 'package:portfolio_in/core/url_launcher/open_url.dart';

final GetIt getit = GetIt.instance;
void setupreposervice() {
  getit.registerLazySingleton<OpenUrl>(() => OpenUrl());
}
