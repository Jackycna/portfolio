import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portfolio_in/core/animation/animation_widget/animation.dart';
import 'package:portfolio_in/core/appTheme/app_theme.dart';
import 'package:portfolio_in/core/get_it_dep_injection/repo_service_injec.dart';
import 'package:portfolio_in/core/url_launcher/open_url.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/features/homescreen/presentation/blocs/homescreen_bloc.dart';
import 'package:portfolio_in/features/splashscreen/presentation/ui/splashscreen.dart';

void main() async {
  setupreposervice();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(
    fileName: kReleaseMode ? ".env.production" : ".env.development",
  );
  final repo = getit<OpenUrl>();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomescreenBloc>(create: (_) => HomescreenBloc(repo)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Sizeconfig.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: AppTheme.theme,
      home: Animationwidget(child: Splashscreen()),
    );
  }
}
