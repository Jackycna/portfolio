import 'package:flutter/material.dart';
import 'package:portfolio_in/core/AppImages/app_images.dart';
import 'package:portfolio_in/core/animation/scaleAnimation/scale_animation.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_bottom_slide.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_right_slide.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/core/widgets/textWidget/normal_text.dart';
import 'package:portfolio_in/features/Projects/data/datasource/projects_data_source.dart';

class FishDelivery extends StatelessWidget {
  const FishDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return FromRightSlide(
      child: Row(
        spacing: Sizeconfig.wp(5),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleAnimation(
            child: Container(
              height: Sizeconfig.hp(60),
              width: Sizeconfig.wp(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizeconfig.wp(5)),
                border: Border.all(
                  color: AppColors.violet.withValues(alpha: 0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pink.withValues(alpha: 0.2),
                    blurRadius: 5,
                    spreadRadius: 5,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(AppImages.seashop),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Column(
            spacing: Sizeconfig.hp(5),
            children: [
              ScaleAnimation(
                child: Container(
                  height: Sizeconfig.hp(40),
                  width: Sizeconfig.wp(50),

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.violet.withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(Sizeconfig.wp(2)),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.pink.withValues(alpha: 0.1),
                        AppColors.violet.withValues(alpha: 0.1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.pink.withValues(alpha: 0.2),
                        blurRadius: 3,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizeconfig.wp(3),
                      ),
                      child: NormalText(
                        text: ProjectsDataSource.seashop,
                        fontsize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: ProjectsDataSource.fishdelivery.map((e) {
                  return FromBottomSlide(
                    child: ScaleAnimation(
                      child: Container(
                        height: Sizeconfig.hp(5),
                        width: Sizeconfig.wp(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.pink.withValues(alpha: 0.5),
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
        ],
      ),
    );
  }
}
