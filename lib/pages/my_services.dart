import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/globals/my_buttons.dart';
import 'package:my_portfolio_website/globals/my_colors.dart';
import 'package:my_portfolio_website/globals/my_text_style.dart';
import 'package:my_portfolio_website/globals/profile_assets.dart';

import '../components/helper_class.dart';
import '../globals/constants.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isApp = false, isWebsite = false, isDataAnalyst = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApp = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'App Development',
              asset: ProfileAssets.code,
              hover: isApp,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isWebsite = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Website Development',
              asset: ProfileAssets.flutter,
              hover: isWebsite,
            ),
          ),
          Constants.sizedBox(height: 24.0),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  asset: ProfileAssets.code,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isWebsite = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Website Development',
                  asset: ProfileAssets.analyst,
                  hover: isWebsite,
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  asset: ProfileAssets.code,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isWebsite = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Website Development',
                  asset: ProfileAssets.analyst,
                  hover: isWebsite,
                ),
              ),
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      bgColor: MyColors.bgColor,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: MyTextStyle.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: MyTextStyle.headingStyles(
                  fontSize: 30.0, color: MyColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required bool hover,
    double width = 350,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 390 : 380,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: MyColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border: hover ? Border.all(color: MyColors.themeColor, width: 3) : null,
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
            asset,
            width: 50,
            height: 50,
            color: MyColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: MyTextStyle.montserratStyle(
                color: Colors.white, fontSize: 22.0),
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            title == 'App Development'
                ? 'As a fresher Flutter developer, I am passionate about creating innovative and functional mobile applications. My expertise lies in leveraging the power of Flutter to build cross-platform apps that provide seamless user experiences on both Android and iOS devices.'
                : 'I specialize in creating responsive and visually appealing websites. Using the latest web technologies and best practices, I build websites that are not only aesthetically pleasing but also provide an excellent user experience.',
            style: MyTextStyle.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 20.0),
          // MyButtons.buildMaterialButton(buttonName: 'Read More', onTap: () {})
        ],
      ),
    );
  }
}
