import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/globals/my_colors.dart';
import 'package:my_portfolio_website/globals/my_text_style.dart';
import '../components/helper_class.dart';
import '../globals/constants.dart';
import '../globals/profile_assets.dart';
import '../models/skill_model.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  final List<Skill> skills = [
    Skill(
      title: 'Flutter',
      description: 'Experience with building cross-platform mobile apps.',
      image: ProfileAssets.flutter,
    ),
    Skill(
      title: 'Dart',
      description: 'Proficient in Dart programming language.',
      image: ProfileAssets.dart,
    ),
    Skill(
      title: 'Firebase',
      description: 'Skilled in Firebase for backend services.',
      image: ProfileAssets.fire,
    ),
    Skill(
      title: 'Git',
      description: 'Experienced with version control using Git.',
      image: ProfileAssets.github,
    ),
    Skill(
      title: 'UI/UX Design',
      description: 'Passionate about designing user-friendly interfaces.',
      image: ProfileAssets.ui,
    ),
    Skill(
      title: 'API Integration',
      description: 'Knowledge of integrating RESTful APIs.',
      image: ProfileAssets.api,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildSkillsText(),
          Constants.sizedBox(height: 60.0),
          buildSkillsGridView(crossAxisCount: 1),
        ],
      ),
      tablet: Column(
        children: [
          buildSkillsText(),
          Constants.sizedBox(height: 60.0),
          buildSkillsGridView(crossAxisCount: 2),
        ],
      ),
      desktop: Column(
        children: [
          buildSkillsText(),
          Constants.sizedBox(height: 60.0),
          buildSkillsGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: MyColors.bgColor,
    );
  }

  GridView buildSkillsGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: skills.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var skill = skills[index];

        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: Container(
            width: 350,
            height: 430,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            decoration: BoxDecoration(
              color: MyColors.bgColor2,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 4.0,
                  blurRadius: 4.5,
                  offset: Offset(3.0, 4.5),
                )
              ],
            ),
            child: Column(
              children: [
                Image.asset(
                  skill.image,
                  width: 130,
                  height: 95,
                ),
                Constants.sizedBox(height: 30.0),
                Text(
                  skill.title,
                  style: MyTextStyle.montserratStyle(
                      color: Colors.white, fontSize: 22.0),
                ),
                Constants.sizedBox(height: 12.0),
                Text(
                  skill.description,
                  style: MyTextStyle.normalStyle(fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
                Constants.sizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
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






