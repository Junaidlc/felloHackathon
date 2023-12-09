import 'package:fello_hackathon/widgets/constant.dart';
import 'package:fello_hackathon/widgets/goal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          _buildSliverList(),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(context) {
    return SliverAppBar(
      actions: [
        _buildAddButton(context),
        kWidth15,
      ],
      pinned: false,
      snap: true,
      floating: true,
      flexibleSpace: const FlexibleSpaceBar(),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return _buildAddGoalBottomSheet();
          },
        );
      },
      icon: const Icon(
        Icons.add,
        size: 30,
        color: kBlack,
      ),
    );
  }

  Widget _buildAddGoalBottomSheet() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 600,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBottomSheetHeader(),
          _buildAmountSection(),
          const Divider(indent: 30, endIndent: 30),
          _buildListTile("Goal Name: STARTUP FUND", Icons.assessment),
          const Divider(indent: 30, endIndent: 30),
          _buildListTile("Target Date: 01/10/2024", Icons.calendar_month),
          const Spacer(),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _buildBottomSheetHeader() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
        ),
        const Text(
          "New Goal",
          style: kTextStyleBold18Black,
          textAlign: TextAlign.center,
        ),
        kWidth15,
      ],
    );
  }

  Widget _buildAmountSection() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "₹",
          style: TextStyle(fontSize: 30),
        ),
        Text(
          "10,00,000",
          style: TextStyle(fontSize: 50),
        ),
      ],
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Icon(
          icon,
          color: kWhite,
        ),
      ),
      title: Text(title),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.70),
      ),
      child: const Center(
        child: Text(
          "Continue",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kWhite,
          ),
        ),
      ),
    );
  }

  SliverList _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _buildGoalsSection();
        },
        childCount: 1,
      ),
    );
  }

  Widget _buildGoalsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Goals", style: kTextStyle40),
            kHeigth,
            GoalCard(
              image: "assets/house_image.jpg",
              name: "Buying House",
              amount: "₹50,00,000",
              percentage: "100% Saved",
              percentIndicator: 1,
              indicatorIcon: Icons.done,
            ),
            kHeigth15,
            GoalCard(
              image: "assets/car_image.jpg",
              name: "Car",
              amount: "₹10,00,000",
              percentage: "60% Saved",
              percentIndicator: 0.60,
              indicatorIcon: Icons.trending_up,
            ),
            kHeigth15,
            GoalCard(
              image: "assets/investment.jpg",
              name: "Savings",
              amount: "₹12,00,000",
              percentage: "33% Saved",
              percentIndicator: 0.33,
              indicatorIcon: Icons.trending_down,
            ),
            kHeigth15,
            GoalCard(
              image: "assets/wedding.jpg",
              name: "Wedding",
              amount: "₹45,00,000",
              percentage: "45% Saved",
              percentIndicator: 0.45,
              indicatorIcon: Icons.trending_up,
            ),
            kHeigth15,
          ],
        ),
      ),
    );
  }
}
