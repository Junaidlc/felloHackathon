import 'package:fello_hackathon/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildSliverList(),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: kWhite,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.more_horiz,
            color: kWhite,
          ),
        )
      ],
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildFlexibleSpaceContent(),
      ),
    );
  }

  Widget _buildFlexibleSpaceContent() {
    return Stack(
      children: [
        Image.asset(
          'assets/house_image.jpg',
          fit: BoxFit.cover,
          height: 400,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildGoalInfo(),
                kHeigth5,
                _buildLinearPercentIndicator(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGoalInfo() {
    return const ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text("Buying House", style: kTextStyleBold20),
      subtitle: Text("₹50,00,000"),
      subtitleTextStyle: kTextStyleBold18,
      trailing: Text("100% of 50,00,000", style: kTextStyle16White),
    );
  }

  Widget _buildLinearPercentIndicator() {
    return LinearPercentIndicator(
      fillColor: kGrey50,
      padding: const EdgeInsets.all(0),
      width: 352.5,
      lineHeight: 5.0,
      percent: 1.0,
      barRadius: const Radius.circular(14),
      progressColor: kWhite,
      animation: true,
      animationDuration: 2000,
    );
  }

  SliverList _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _buildOverviewAndRules();
        },
        childCount: 1,
      ),
    );
  }

  Widget _buildOverviewAndRules() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Overview", style: kTextStyle18Opacity70),
          _buildOverviewListTile(
              "Upcoming deposits", "+ ₹0", Icons.access_time),
          Text("Rules", style: kTextStyle18Opacity70),
          _buildRulesListTile(
              "Set & Forgot", "Save ₹5000 every week", Icons.calendar_month),
          _buildRulesListTile(
              "Target Date", "01/11/2023", Icons.calendar_month),
        ],
      ),
    );
  }

  Widget _buildOverviewListTile(String title, String trailing, IconData icon) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
      leading: Icon(
        icon,
        color: kBlack,
        size: 25,
      ),
      title: Text(title, style: kTextStyleBold18Black),
      trailing: Text(
        trailing,
        style: kTextStyleBold18Black,
      ),
    );
  }

  Widget _buildRulesListTile(String title, String subtitle, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Icon(
          icon,
          color: kWhite,
        ),
      ),
      title: Text(
        title,
        style: kTextStyleBold18Black,
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
