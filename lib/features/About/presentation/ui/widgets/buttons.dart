import 'package:flutter/material.dart';
import 'package:portfolio_in/core/AppImages/app_images.dart';
import 'package:portfolio_in/core/animation/scaleAnimation/scale_animation.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_left_slide.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/env_helper/env_helper.dart';
import 'package:portfolio_in/core/url_launcher/open_url.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/core/widgets/textWidget/normal_text.dart';
import 'package:portfolio_in/core/widgets/textWidget/title_text.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizeconfig.wp(2.5),
        vertical: Sizeconfig.hp(2),
      ),
      child: Column(
        spacing: Sizeconfig.hp(1),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: "Let's Connect", color: AppColors.pink),
          NormalText(
            text:
                "Have a project in mind? Let's build\nsomething amazing together.",
          ),
          FromLeftSlide(
            child: Padding(
              padding: EdgeInsets.only(top: Sizeconfig.hp(3)),
              child: Row(
                spacing: Sizeconfig.wp(2),
                children: [
                  ScaleAnimation(
                    onpressed: () => OpenUrl().mailto(),
                    child: Image.asset(
                      AppImages.email,
                      color: AppColors.pink,
                      height: Sizeconfig.hp(5),
                    ),
                  ),
                  ScaleAnimation(
                    onpressed: () => OpenUrl().loadUrl(EnvHelper.insta),
                    child: Image.asset(
                      AppImages.insta,
                      color: AppColors.pink,
                      height: Sizeconfig.hp(5),
                    ),
                  ),
                  ScaleAnimation(
                    onpressed: () => OpenUrl().loadUrl(EnvHelper.linkedIn),
                    child: Image.asset(
                      AppImages.linkein,
                      color: AppColors.pink,
                      height: Sizeconfig.hp(5),
                    ),
                  ),
                  ScaleAnimation(
                    onpressed: () => OpenUrl().makecall(),
                    child: Image.asset(
                      AppImages.phone,
                      color: AppColors.pink,
                      height: Sizeconfig.hp(5),
                    ),
                  ),
                  ScaleAnimation(
                    onpressed: () => OpenUrl().loadUrl(EnvHelper.github),
                    child: Image.asset(
                      AppImages.github,
                      color: AppColors.pink,
                      height: Sizeconfig.hp(5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
