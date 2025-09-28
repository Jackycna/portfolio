import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/core/widgets/textWidget/normal_text.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/root_screen_bloc.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/root_screen_event.dart';

class TopButtons extends StatelessWidget {
  final Buttons button;
  final int index;
  const TopButtons({super.key, required this.button, required this.index});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      {'name': 'Home', 'button': Buttons.home},
      {'name': 'Skills', 'button': Buttons.skills},
      {'name': 'Project', 'button': Buttons.projects},
      {'name': 'About', 'button': Buttons.about},
    ];

    var width = MediaQuery.of(context).size.width;
    final bloc = context.read<RootScreenBloc>();
    return Row(
      spacing: width * 0.03,
      mainAxisAlignment: MainAxisAlignment.end,
      children: pages.asMap().entries.map((e) {
        bool iscurrentbutton = button == e.value['button'];
        bool iscurrentPage = index == e.key;
        return AnimatedScale(
          scale: iscurrentbutton ? 1.1 : 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            height: Sizeconfig.hp(5),
            width: Sizeconfig.wp(5),
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizeconfig.wp(0.7)),
              color: AppColors.black,

              boxShadow: [
                BoxShadow(
                  color: AppColors.pink.withValues(
                    alpha: iscurrentPage ? 0.5 : 0,
                  ),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(Sizeconfig.wp(0.7)),
              onTap: () {
                bloc.add(ChangeIndex(index: e.key));
              },
              onHover: (value) {
                if (value) {
                  bloc.add(ChangeButton(button: e.value['button']));
                } else {
                  context.read<RootScreenBloc>().add(
                    ChangeButton(button: Buttons.others),
                  );
                }
              },

              child: Center(child: NormalText(text: e.value['name'])),
            ),
          ),
        );
      }).toList(),
    );
  }
}
