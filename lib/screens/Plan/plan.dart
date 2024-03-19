import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/saves.dart';
import 'components/trips.dart';

class Plan extends StatelessWidget {
  const Plan({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kDefaultPadding),
            Text(
              "Get to know Trips",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: kDefaultPadding),
            const Text(
              "Now there's two ways to plan your trip- use AI or search on your. Either way, you've got more than 8 million spots to discover, with over one billion traveler reviews and opinioms to guid you.",
            ),
            const SizedBox(height: kDefaultPadding),
            const TabView(),
          ],
        ),
      ),
    );
  }
}

class TabView extends StatefulWidget {
  const TabView({
    super.key,
  });

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          width: 150,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Trips',
              ),
              Tab(
                text: 'Saves',
              ),
            ],
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: const [
              Trips(),
              Saves(),
            ],
          ),
        ),
      ],
    );
  }
}
