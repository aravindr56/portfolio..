import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/globals/my_colors.dart';
import 'package:my_portfolio_website/globals/my_text_style.dart';

import '../models/project_model.dart';


class ProjectDetail extends StatelessWidget {
  final Project project;

  const ProjectDetail({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.bgColor,
        title: Text(project.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: MyColors.bgColor2,
      body: Column(
        children: [
          CarouselSlider(
            items: project.images.map((image) {
              return Container(
                width: 550,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  // color: MyColors.bgColor2,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.contain,

                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 450.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              project.description,
              style: MyTextStyle.normalStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
