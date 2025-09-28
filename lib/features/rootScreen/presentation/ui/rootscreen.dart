import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/widgets/textWidget/title_text.dart';
import 'package:portfolio_in/features/rootScreen/presentation/ui/widgets/top_buttons.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/root_screen_bloc.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/rootscreen_state.dart';

class Rootscreen extends StatefulWidget {
  const Rootscreen({super.key});

  @override
  State<Rootscreen> createState() => _RootscreenState();
}

class _RootscreenState extends State<Rootscreen> {
  bool show = false;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootScreenBloc>(
      create: (context) => RootScreenBloc(),
      child: BlocConsumer<RootScreenBloc, RootscreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TitleText(
                      text: 'Jackson',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: AppColors.white,
                        shadows: [
                          Shadow(
                            color: AppColors.pink,
                            blurRadius: 5,
                            offset: Offset(-1, 0),
                          ),
                        ],
                      ),
                    ),
                    TopButtons(index: state.index, button: state.button),
                  ],
                ),
              ),
            ),
            body: state.currentPage,
          );
        },
      ),
    );
  }
}
