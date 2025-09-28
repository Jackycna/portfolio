import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/core/AppImages/app_images.dart';
import 'package:portfolio_in/core/animation/scaleAnimation/scale_animation.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_left_slide.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_right_slide.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/env_helper/env_helper.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/core/widgets/textWidget/normal_text.dart';
import 'package:portfolio_in/core/widgets/textWidget/title_text.dart';
import 'package:portfolio_in/features/homescreen/presentation/blocs/homescree_state.dart';
import 'package:portfolio_in/features/homescreen/presentation/blocs/homescreen_bloc.dart';
import 'package:portfolio_in/features/homescreen/presentation/blocs/homescreen_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomescreenBloc, HomescreeState>(
      builder: (context, state) {
        final bloc = context.read<HomescreenBloc>();
        return Scaffold(
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: Sizeconfig.hp(10)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: Sizeconfig.wp(5),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: Sizeconfig.wp(15)),
                    FromLeftSlide(
                      child: ScaleAnimation(
                        child: Container(
                          height: Sizeconfig.hp(50),
                          width: Sizeconfig.wp(25),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            boxShadow: [
                              BoxShadow(
                                color: AppColors.pink.withValues(alpha: 0.8),
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset: Offset(-2, 0),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(AppImages.ringlight),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FromRightSlide(
                      child: SizedBox(
                        width: Sizeconfig.wp(35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TitleText(
                              text: "Hello,I'M JACKSON",
                              style: TextStyle(
                                fontSize: 25,
                                color: AppColors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            NormalText(
                              text:
                                  'Flutter Developer  Building beautiful, high-performance mobile apps',
                            ),
                            SizedBox(height: Sizeconfig.hp(3)),
                            NormalText(
                              text:
                                  'Passionate about turning ideas into digital products, I creaft smooth,responsive and visually appealing apps using Flutter',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Sizeconfig.hp(5),
                              ),
                              child: SingleChildScrollView(
                                child: Row(
                                  spacing: Sizeconfig.wp(0.5),
                                  children: [
                                    ScaleAnimation(
                                      onpressed: () => bloc.add(
                                        LaunchUrl(url: EnvHelper.linkedIn),
                                      ),
                                      child: Container(
                                        height: Sizeconfig.hp(5),
                                        decoration: BoxDecoration(),
                                        child: Image.asset(
                                          AppImages.linkein,
                                          color: AppColors.pink,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    ScaleAnimation(
                                      child: Container(
                                        height: Sizeconfig.hp(5),
                                        decoration: BoxDecoration(),
                                        child: Image.asset(
                                          AppImages.email,
                                          color: AppColors.pink,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    ScaleAnimation(
                                      onpressed: () => bloc.add(
                                        LaunchUrl(url: EnvHelper.insta),
                                      ),
                                      child: Container(
                                        height: Sizeconfig.hp(5),
                                        decoration: BoxDecoration(),
                                        child: Image.asset(
                                          AppImages.insta,
                                          color: AppColors.pink,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    ScaleAnimation(
                                      onpressed: () => bloc.add(
                                        LaunchUrl(url: EnvHelper.github),
                                      ),
                                      child: Container(
                                        height: Sizeconfig.hp(5),
                                        decoration: BoxDecoration(),
                                        child: Image.asset(
                                          AppImages.github,
                                          color: AppColors.pink,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // FromBottomSlide(
                            //   child: ScaleAnimation(
                            //     onpressed: () => bloc.add(DownloadCV()),
                            //     child: Container(
                            //       height: Sizeconfig.hp(8),
                            //       width: Sizeconfig.wp(15),
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(
                            //           Sizeconfig.wp(2),
                            //         ),
                            //         gradient: LinearGradient(
                            //           colors: [
                            //             AppColors.pink,
                            //             AppColors.violet,
                            //           ],
                            //         ),
                            //       ),
                            //       child: Center(
                            //         child: TitleText(text: 'Download CV'),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
