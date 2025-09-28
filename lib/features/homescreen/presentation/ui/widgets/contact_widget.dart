import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/core/AppImages/app_images.dart';
import 'package:portfolio_in/core/animation/scaleAnimation/scale_animation.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_bottom_slide.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_left_slide.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_right_slide.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/env_helper/env_helper.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/features/homescreen/presentation/blocs/homescreen_bloc.dart';
import 'package:portfolio_in/features/homescreen/presentation/blocs/homescreen_event.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomescreenBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FromLeftSlide(
          child: ScaleAnimation(
            onpressed: () {
              bloc.add(SendEmail());
            },
            child: Container(
              height: Sizeconfig.hp(5),
              width: Sizeconfig.wp(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pink,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(AppImages.email),
              ),
            ),
          ),
        ),
        FromBottomSlide(
          child: ScaleAnimation(
            onpressed: () {
              bloc.add(CallEvent());
            },
            child: Container(
              height: Sizeconfig.hp(5),
              width: Sizeconfig.wp(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pink,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(AppImages.phone),
              ),
            ),
          ),
        ),
        FromRightSlide(
          child: ScaleAnimation(
            onpressed: () {
              bloc.add(LaunchUrl(url: EnvHelper.insta));
            },
            child: Container(
              height: Sizeconfig.hp(5),
              width: Sizeconfig.wp(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pink,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(AppImages.insta),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
