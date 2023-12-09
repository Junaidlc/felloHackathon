import 'package:fello_hackathon/screen/goals_screen.dart';
import 'package:fello_hackathon/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    Key? key,
    required this.image,
    required this.name,
    required this.amount,
    required this.percentage,
    required this.percentIndicator,
    required this.indicatorIcon,
  }) : super(key: key);

  final String image;
  final String name;
  final String amount;
  final String percentage;
  final double percentIndicator;
  final IconData indicatorIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const GoalsScreen());
      },
      child: Container(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 16),
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.multiply,
            ),
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(name, style: kTextStyleBold20),
              subtitle: Text(amount),
              subtitleTextStyle: kTextStyleBold18,
              trailing: CircleAvatar(
                backgroundColor: kTransparent,
                child: Icon(indicatorIcon),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  percentage,
                  style: const TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            kHeigth5,
            LinearPercentIndicator(
              fillColor: kGrey50,
              padding: const EdgeInsets.all(0),
              width: 321,
              lineHeight: 5.0,
              percent: percentIndicator,
              barRadius: const Radius.circular(14),
              progressColor: kWhite,
              animation: true,
              animationDuration: 2000,
            ),
          ],
        ),
      ),
    );
  }
}
