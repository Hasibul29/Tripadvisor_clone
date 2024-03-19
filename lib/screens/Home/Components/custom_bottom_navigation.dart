import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: const EdgeInsets.only(bottom: 70),
      indicatorWeight: 3,
      unselectedLabelColor:
          Theme.of(context).colorScheme.primary.withOpacity(0.6),
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.secondary),
      controller: _tabController,
      tabs: const [
        Tab(
          icon: Icon(Icons.home_outlined),
          text: 'Explore',
          iconMargin: EdgeInsets.only(bottom: 0.0),
        ),
        Tab(
          icon: Icon(Icons.search_rounded),
          text: 'Search',
          iconMargin: EdgeInsets.only(bottom: 0.0),
        ),
        Tab(
          icon: Icon(Icons.favorite_border),
          text: 'Plan',
          iconMargin: EdgeInsets.only(bottom: 0.0),
        ),
        Tab(
          icon: Icon(Icons.mode_edit_outline_outlined),
          text: 'Review',
          iconMargin: EdgeInsets.only(bottom: 0.0),
        ),
        Tab(
          icon: Icon(Icons.account_circle_outlined),
          text: 'Account',
          iconMargin: EdgeInsets.only(bottom: 0.0),
        ),
      ],
    );
  }
}
