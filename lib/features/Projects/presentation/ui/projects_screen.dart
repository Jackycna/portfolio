import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_in/core/animation/scaleAnimation/scale_animation.dart';
import 'package:portfolio_in/core/animation/slideAnimation/from_left_slide.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';
import 'package:portfolio_in/core/utils/sizeConfig/sizeconfig.dart';
import 'package:portfolio_in/core/widgets/textWidget/title_text.dart';
import 'package:portfolio_in/features/Projects/presentation/bloc/project_state.dart';
import 'package:portfolio_in/features/Projects/presentation/bloc/projects_bloc.dart';
import 'package:portfolio_in/features/Projects/presentation/ui/widgets/calender.dart';
import 'package:portfolio_in/features/Projects/presentation/ui/widgets/employee_portal.dart';
import 'package:portfolio_in/features/Projects/presentation/ui/widgets/fish_delivery.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
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
    return BlocProvider<ProjectsBloc>(
      create: (context) => ProjectsBloc(),
      child: BlocBuilder<ProjectsBloc, ProjectState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizeconfig.hp(5),
              horizontal: Sizeconfig.wp(3),
            ),
            child: ListView(
              children: [
                Center(
                  child: ScaleAnimation(
                    child: FromLeftSlide(
                      child: TitleText(
                        text: 'Fish Delivery Application',
                        fontsize: 25,
                        color: AppColors.pink,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Sizeconfig.hp(10)),
                FishDelivery(),
                SizedBox(height: Sizeconfig.hp(10)),
                Align(
                  alignment: AlignmentGeometry.center,
                  child: ScaleAnimation(
                    child: FromLeftSlide(
                      child: TitleText(
                        text: 'Employee Portal Application',
                        fontsize: 25,
                        color: AppColors.pink,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Sizeconfig.hp(5)),
                EmployeePortal(),
                SizedBox(height: Sizeconfig.hp(10)),
                Center(
                  child: ScaleAnimation(
                    child: FromLeftSlide(
                      child: TitleText(
                        text: 'Calender Application',
                        fontsize: 25,
                        color: AppColors.pink,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Sizeconfig.hp(5)),
                Calender(),
                SizedBox(height: Sizeconfig.hp(10)),
              ],
            ),
          );
        },
      ),
    );
  }
}
