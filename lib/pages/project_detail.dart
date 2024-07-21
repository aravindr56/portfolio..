import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/globals/my_text_style.dart';


class Project {
  final String title;
  final String description;
  final List<String> images;

  Project({
    required this.title,
    required this.description,
    required this.images,
  });
}

class ProjectDetail extends StatelessWidget {
  final Project project;

  const ProjectDetail({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: project.images.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(project.images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              project.description,
              style: MyTextStyle.normalStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
