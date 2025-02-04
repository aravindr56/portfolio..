import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/globals/my_colors.dart';
import 'package:my_portfolio_website/globals/my_text_style.dart';
import '../models/project_model.dart';
import 'project_detail.dart';
import '../components/helper_class.dart';
import '../globals/constants.dart';
import '../globals/profile_assets.dart';

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final onHoverEffect = Matrix4.identity()..scale(1.0);

  List<Project> projects = [
    Project(
      title: 'Expense Tracker App',
      description: 'The Expense Tracker App helps users manage their finances by tracking income and expenses. Key features include secure user authentication,easy transaction logging.',
      images: [
        ProfileAssets.project1,
        ProfileAssets.exp1,
        ProfileAssets.exp2,
        ProfileAssets.exp3,
        ProfileAssets.exp4,
        ProfileAssets.exp5,
        ProfileAssets.exp6,
        ProfileAssets.exp7,
        ProfileAssets.exp8
      ],
    ),
    Project(
      title: 'Weather App',
      description: 'The Weather App provides real-time weather updates and forecasts.current weather conditions,location-based tracking and integrated weather APIs,',
      images: [ProfileAssets.project2,
        ProfileAssets.wthr1,
        ProfileAssets.wthr2,
        ProfileAssets.wthr3,
        ProfileAssets.wthr4,
        ProfileAssets.wthr5,
      ],
    ),
    Project(
      title: 'To Do App',
      description: 'The To-Do App helps users manage their tasks efficiently with features like task creation, categorization, due date reminders.Interface built using Flutter.',
      images: [
        ProfileAssets.project3,
        ProfileAssets.to1,
        ProfileAssets.to2,
        ProfileAssets.to3,
        ProfileAssets.to4,
      ],
    ),
    Project(
      title: 'Bike Rental App',
      description: 'The Bike Rental App provides for users to find, rent, and manage bike rentals. Users browse available bikes, view rental locations,ensuring a smooth experience.',
      images: [
        ProfileAssets.project4,
        ProfileAssets.bike1,
        ProfileAssets.bike2,
        ProfileAssets.bike3,
        ProfileAssets.bike4,
      ],
    ),
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
          buildProjectGridView(crossAxisCount: 1),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2),
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
      itemCount: projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var project = projects[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetail(project: project),
                ),
              );
            },
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
                      image: AssetImage(project.images[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == hoveredIndex ? onHoverEffect : null,
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
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          project.title,
                          style: MyTextStyle.montserratStyle(
                              color: Colors.black87, fontSize: 20),
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(
                          project.description,
                          style: MyTextStyle.normalStyle(color: Colors.black87),
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
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}


