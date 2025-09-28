import 'package:flutter/material.dart';
import 'package:portfolio_in/features/About/presentation/ui/about_screen.dart';
import 'package:portfolio_in/features/Projects/presentation/ui/projects_screen.dart';
import 'package:portfolio_in/features/Skills/presentation/ui/skills_screen.dart';

import 'package:portfolio_in/features/homescreen/presentation/ui/home_screen.dart';

class RootScreenDataSource {
  static final List<Widget> screens = [
    HomeScreen(),
    SkillsScreen(),
    ProjectsScreen(),
    AboutScreen(),
  ];
}
