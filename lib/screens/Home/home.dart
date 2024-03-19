import 'package:flutter/material.dart';

import '../explore.dart';
import '../Plan/plan.dart';
import '../Search/search.dart';
import '../review.dart';
import 'Components/custom_bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNavigation(tabController: _tabController),
      body: SafeArea(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [
            Explore(),
            Search(),
            Plan(),
            Review(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
