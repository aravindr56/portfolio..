import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/globals/my_colors.dart';
import 'package:my_portfolio_website/globals/my_text_style.dart';
import 'package:my_portfolio_website/globals/profile_assets.dart';
import '../components/helper_class.dart';
import '../globals/constants.dart';
import '../globals/skill_set.dart';

class SkillScreen extends StatelessWidget {
  final List<Skill> skills = [
    Skill(name: 'Flutter', image: ProfileAssets.flutter, description: 'A UI toolkit for building natively compiled applications.'),
    Skill(name: 'Dart', image: ProfileAssets.dart, description: 'A programming language optimized for building mobile apps.'),
    Skill(name: 'Firebase', image: ProfileAssets.fire, description: 'A platform developed by Google for creating mobile and web applications.'),
    // Add more skills here
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: buildSkillGrid(),
      tablet: buildSkillGrid(),
      desktop: buildSkillGrid(),
      paddingWidth: size.width * 0.04,
      bgColor: MyColors.bgColor,
    );
  }

  Widget buildSkillGrid() {
    return Column(
      children: [
        buildSkillsText(),
        Constants.sizedBox(height: 60.0),
        Expanded(
          child: GridView.builder(
            itemCount: skills.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              return FadeInUp(
                duration: Duration(milliseconds: 500 * (index + 1)),
                child: SkillContainer(skill: skills[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  FadeInDown buildSkillsText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: MyTextStyle.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Skills',
              style: MyTextStyle.headingStyles(
                  fontSize: 30.0, color: MyColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}

class SkillContainer extends StatelessWidget {
  final Skill skill;

  const SkillContainer({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            skill.image,
            width: 60,
            height: 60,
          ),
          SizedBox(height: 10),
          Text(
            skill.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            skill.description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}





