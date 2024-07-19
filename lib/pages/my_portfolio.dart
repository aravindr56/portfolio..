import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/globals/my_colors.dart';
import 'package:my_portfolio_website/globals/my_text_style.dart';

import '../components/helper_class.dart';
import '../globals/constants.dart';
import '../globals/profile_assets.dart';
class MyPortfolio extends StatefulWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    ProfileAssets.work1,
    ProfileAssets.work1,
    ProfileAssets.work1,
    ProfileAssets.work1,
    ProfileAssets.work1,
    ProfileAssets.work1,
  ];

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: MyColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var image = images[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill),
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == hoveredIndex ? onH0verEffect : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            MyColors.themeColor.withOpacity(1.0),
                            MyColors.themeColor.withOpacity(0.9),
                            MyColors.themeColor.withOpacity(0.8),
                            MyColors.themeColor.withOpacity(0.6),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'App Development',
                          style: MyTextStyle.montserratStyle(
                              color: Colors.black87, fontSize: 20),
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                          style:
                          MyTextStyle.normalStyle(color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        Constants.sizedBox(height: 30.0),
                        CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            ProfileAssets.share,
                            width: 25,
                            height: 25,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: MyTextStyle.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: MyTextStyle.headingStyles(
                  fontSize: 30, color: MyColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}