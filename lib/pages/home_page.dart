import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/helper_class.dart';
import '../globals/constants.dart';
import '../globals/my_colors.dart';
import '../globals/my_text_style.dart';
import '../globals/profile_assets.dart';
import '../widgets/profile_animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class StorageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> getUrlFromFirestore() async {
    final snapshot = await _firestore.collection('cv_urls').get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data()['url'] as String?;
    }
    return null;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String>[
    ProfileAssets.linkedIn,
    ProfileAssets.github,
  ];

  final socialLinks = <String>[
    'https://www.linkedin.com/in/aravind-r-flutter-developer',
    'https://github.com/aravindr56',
  ];

  int? socialBI;
  final StorageService storageService = StorageService();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation(),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: MyTextStyle.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Aravind R',
            style: MyTextStyle.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: MyTextStyle.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle: MyTextStyle.montserratStyle(color: Colors.lightBlue),
                  ),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Text(
          'Hello! Im Aravind R, a passionate and dedicated fresher Flutter developer. I specialize in building beautiful and responsive mobile applications using the Flutter framework. With a keen eye for design and a strong commitment to writing clean, maintainable code, I strive to create seamless user experiences',
            style: MyTextStyle.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: Scrollbar(
              controller: _scrollController,
              child: ListView.separated(
                controller: _scrollController,
                itemCount: socialButtons.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, child) => Constants.sizedBox(width: 8.0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      final url = socialLinks[index];
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    onHover: (value) {
                      setState(() {
                        socialBI = value ? index : null;
                      });
                    },
                    borderRadius: BorderRadius.circular(550.0),
                    hoverColor: MyColors.themeColor,
                    splashColor: MyColors.lawGreen,
                    child: buildSocialButton(
                      asset: socialButtons[index],
                      hover: socialBI == index,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: ElevatedButton(
            onPressed: () async {
              String? url = await storageService.getUrlFromFirestore();
              if (url != null) {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  Get.snackbar('Error', 'Could not launch URL');
                }
              } else {
                Get.snackbar('Error', 'No CV found');
              }
            },
            child: const Text('Download CV'),
          ),
        ),
      ],
    );
  }
  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      // decoration: BoxDecoration(
      //   border: Border.all(color: MyColors.themeColor, width: 2.0),
      //   color: MyColors.bgColor,
      //   shape: BoxShape.circle,
      // ),
      padding: const EdgeInsets.all(6),
      child: ClipOval(
        child: Image.asset(
          asset,
          width: 10,
          height: 12,
          color: hover ? MyColors.bgColor : MyColors.themeColor,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  }




