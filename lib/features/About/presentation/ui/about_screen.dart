import 'package:flutter/material.dart';
import 'package:portfolio_in/core/AppImages/app_images.dart';
import 'package:portfolio_in/core/animation/scaleAnimation/scale_animation.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_bottom_slide.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/core/widgets/textWidget/normal_text.dart';
import 'package:portfolio_in/core/widgets/textWidget/title_text.dart';
import 'package:portfolio_in/features/About/data/datasource/about_datasource.dart';
import 'package:portfolio_in/features/About/presentation/ui/widgets/buttons.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: Sizeconfig.hp(35),
            decoration: BoxDecoration(
              color: AppColors.pink.withValues(alpha: 0.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Sizeconfig.hp(40),
                  width: Sizeconfig.wp(20),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(AppImages.nobackground),
                ),
                Expanded(
                  child: Column(
                    spacing: Sizeconfig.hp(2),
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: Sizeconfig.hp(5)),
                        child: TitleText(
                          text: "Hello, I'm Jackson",
                          color: AppColors.pink,
                          fontsize: 25,
                        ),
                      ),
                      TitleText(
                        text:
                            'A Flutter Developer Crafting Smooth,Responsive,and User Freindly Apps',
                      ),
                      Expanded(
                        child: NormalText(
                          text:
                              "I'm passionate about building cross platform mobile apps using Flutter.I focus on writing clean,maintainable code and creating great user experience, ",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Sizeconfig.hp(5)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: Sizeconfig.wp(2.5)),
                SizedBox(
                  width: Sizeconfig.wp(45),
                  child: Column(
                    spacing: Sizeconfig.hp(3),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(text: 'My Journey So Far'),
                      NormalText(
                        text:
                            "I started my journey with Flutter and Firebase,building cross-platform apps with smooth UI and roubust backend integration. I've also worked with Python and FastApi for backend services. I thrive in collaborative environments and enjoy learning new technologies to expand my skill set.",
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Sizeconfig.wp(5)),
                SizedBox(
                  width: Sizeconfig.wp(45),
                  child: Column(
                    spacing: Sizeconfig.hp(3),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(text: 'Beyond the Screen'),
                      NormalText(
                        text:
                            "When I'm not coding, I enjoy exploring new technologies, learning Angular, reaching tech blogs, and experimenting with small Python projects ",
                      ),
                      Row(
                        children: AboutDatasource.aboutimages.map((e) {
                          return FromBottomSlide(
                            child: ScaleAnimation(
                              child: Container(
                                height: Sizeconfig.hp(5),
                                width: Sizeconfig.wp(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.pink.withValues(
                                        alpha: 0.5,
                                      ),
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage(e)),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Buttons(),
        ],
      ),
    );
  }
}
