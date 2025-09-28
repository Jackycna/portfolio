import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/core/AppImages/app_images.dart';
import 'package:portfolio_in/core/animation/scaleAnimation/scale_animation.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_bottom_slide.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_left_slide.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_right_slide.dart';
import 'package:portfolio_in/core/animation/text_animation/text_animation.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/core/widgets/textWidget/title_text.dart';
import 'package:portfolio_in/features/Skills/data/data_source/skills_data_source.dart';
import 'package:portfolio_in/features/Skills/presentation/bloc/skills_bloc.dart';
import 'package:portfolio_in/features/Skills/presentation/bloc/skills_state.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/root_screen_bloc.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/root_screen_event.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SkillsBloc>(
      create: (context) => SkillsBloc(),
      child: BlocBuilder<SkillsBloc, SkillsState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizeconfig.wp(3),
                vertical: Sizeconfig.hp(5),
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: Sizeconfig.wp(2),
                      children: [
                        FromLeftSlide(
                          child: ScaleAnimation(
                            child: Container(
                              height: Sizeconfig.hp(35),
                              width: Sizeconfig.wp(22),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.pink.withValues(alpha: 0.1),
                                    AppColors.violet.withValues(alpha: 0.1),
                                  ],
                                ),

                                borderRadius: BorderRadius.circular(
                                  Sizeconfig.wp(2),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Sizeconfig.wp(2),
                                  ),
                                  child: TextAnimation(
                                    text:
                                        "Along with my core skills in flutter and Firebae, I focus on writing clean and secure code. I've successfully built and published mobile apps, integrating features like authentication, notifications,and realtime data. Currently, I'm exploring advanced state management and backend integration to strengthen my full-statck development skills.",
                                    duration: Duration(microseconds: 1),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      shadows: [
                                        Shadow(
                                          color: AppColors.black,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          spacing: Sizeconfig.hp(3),
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextAnimation(
                              text: 'Confident',
                              duration: Duration(microseconds: 10),
                              style: TextStyle(
                                color: AppColors.pink,

                                shadows: [
                                  Shadow(
                                    color: AppColors.white.withValues(
                                      alpha: 0.1,
                                    ),
                                    blurRadius: 10,
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              spacing: Sizeconfig.wp(1),
                              children: SkillsDataSource.images1.map((e) {
                                return Opacity(
                                  opacity: 0.8,
                                  child: FromLeftSlide(
                                    child: ScaleAnimation(
                                      child: Container(
                                        height: Sizeconfig.hp(11),
                                        width: Sizeconfig.wp(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          image: DecorationImage(
                                            image: AssetImage(e),
                                          ),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.pink,
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            Row(
                              spacing: Sizeconfig.wp(1),
                              children: SkillsDataSource.images2.map((e) {
                                return Opacity(
                                  opacity: 0.8,
                                  child: FromRightSlide(
                                    child: ScaleAnimation(
                                      child: Container(
                                        height: Sizeconfig.hp(11),
                                        width: Sizeconfig.wp(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          image: DecorationImage(
                                            image: AssetImage(e),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.pink,
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                            ),
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        FromRightSlide(
                          child: ScaleAnimation(
                            child: Container(
                              height: Sizeconfig.hp(35),
                              width: Sizeconfig.wp(35),
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.01),
                                borderRadius: BorderRadius.circular(
                                  Sizeconfig.wp(2),
                                ),
                              ),
                              child: Center(
                                child: TitleText(
                                  text: 'Building Skills\nFor Future',

                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: AppColors.pink,
                                    shadows: [
                                      Shadow(
                                        color: AppColors.white,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Sizeconfig.hp(5)),
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: Sizeconfig.wp(1),
                      children: [
                        FromLeftSlide(
                          child: Container(
                            height: Sizeconfig.hp(35),
                            width: Sizeconfig.wp(25),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.01),
                              borderRadius: BorderRadius.circular(
                                Sizeconfig.wp(2),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizeconfig.wp(1),
                                vertical: Sizeconfig.hp(1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: Sizeconfig.hp(0.1),
                                children: [
                                  ScaleAnimation(
                                    child: TextAnimation(
                                      text: 'Comfortable',
                                      duration: Duration(microseconds: 10),
                                      style: TextStyle(
                                        color: AppColors.pink,

                                        shadows: [
                                          Shadow(
                                            color: AppColors.white.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 5,
                                          ),
                                        ],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Sizeconfig.hp(0.5)),
                                  Expanded(
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            childAspectRatio: 1.7,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 10,
                                          ),
                                      itemCount:
                                          SkillsDataSource.imagesbasic.length,
                                      itemBuilder: (context, index) {
                                        return Opacity(
                                          opacity: 0.8,
                                          child: ScaleAnimation(
                                            child: Container(
                                              height: Sizeconfig.hp(10),
                                              width: Sizeconfig.wp(10),
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    SkillsDataSource
                                                        .imagesbasic[index],
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.pink,
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FromBottomSlide(
                          child: Container(
                            height: Sizeconfig.hp(35),
                            width: Sizeconfig.wp(40),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.01),
                              borderRadius: BorderRadius.circular(
                                Sizeconfig.wp(2),
                              ),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.all(Sizeconfig.wp(1)),
                                child: Column(
                                  spacing: Sizeconfig.wp(1),
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ScaleAnimation(
                                      child: TextAnimation(
                                        text: 'Projects',
                                        duration: Duration(microseconds: 10),
                                        style: TextStyle(
                                          color: AppColors.pink,

                                          shadows: [
                                            Shadow(
                                              color: AppColors.white.withValues(
                                                alpha: 0.3,
                                              ),
                                              blurRadius: 10,
                                            ),
                                          ],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: SkillsDataSource.project.map((
                                        e,
                                      ) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: Sizeconfig.wp(1.5),
                                          ),
                                          child: Opacity(
                                            opacity: 0.8,
                                            child: ScaleAnimation(
                                              onpressed: () => context
                                                  .read<RootScreenBloc>()
                                                  .add(ChangeIndex(index: 2)),
                                              child: Container(
                                                height: Sizeconfig.hp(20),
                                                width: Sizeconfig.wp(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        Sizeconfig.wp(2),
                                                      ),
                                                  color: AppColors.white,
                                                  image: DecorationImage(
                                                    image: AssetImage(e),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.pink,
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        FromRightSlide(
                          child: ScaleAnimation(
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                height: Sizeconfig.hp(35),
                                width: Sizeconfig.wp(27),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.pink.withValues(
                                        alpha: 0.3,
                                      ),
                                      spreadRadius: 10,
                                      blurRadius: 5,
                                    ),
                                  ],
                                  color: AppColors.white.withValues(
                                    alpha: 0.01,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.flutterbird),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
