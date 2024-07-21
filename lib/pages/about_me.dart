import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../components/helper_class.dart';
import '../globals/constants.dart';
import '../globals/my_buttons.dart';
import '../globals/my_colors.dart';
import '../globals/my_text_style.dart';



class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(height: 35.0),
          // buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: MyColors.bgColor2,
    );
  }

  // FadeInRight buildProfilePicture() {
  //   return FadeInRight(
  //     duration: const Duration(milliseconds: 1200),
  //     child: Image.asset(
  //       ProfileAssets.profile,
  //       height: 450,
  //       width: 400,
  //     ),
  //   );
  // }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: MyTextStyle.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: MyTextStyle.headingStyles(
                      fontSize: 30, color: MyColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Flutter Developer!',
            style: MyTextStyle.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            'As a newcomer to the world of Flutter development, I am constantly learning and evolving. My journey began with a fascination for mobile app development, and Flutter quickly became my platform of choice due to its versatility and efficiency. I am excited about the endless possibilities in app development and am always eager to take on new challenges',
            style: MyTextStyle.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: MyButtons.buildMaterialButton(
              onTap: () {}, buttonName: 'Read More'),
        )
      ],
    );
  }
}