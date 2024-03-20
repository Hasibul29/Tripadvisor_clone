import 'package:flutter/material.dart';
import 'package:tripadvisor/constants.dart';
import 'package:tripadvisor/screens/AITrips/Components/page3.dart';

import '../../common/progress_bar.dart';
import 'Components/page1.dart';
import 'Components/page2.dart';
import 'Components/page4.dart';

class AiTrip extends StatefulWidget {
  const AiTrip({super.key});

  @override
  State<AiTrip> createState() => _AiTripState();
}

class _AiTripState extends State<AiTrip> {
  List<bool> screens = [false, false, true, false];

  int _currentPage = 0;
  String title = "";
  double get _progressValue => (_currentPage + 1) / 4;
  void animateToPreviousPage(int currentPage) {
    setState(() {
      _currentPage = currentPage;
    });
  }

  void animateToNextPage(int currentPage) {
    setState(() {
      _currentPage = currentPage;
    });
  }

  void updateTitle(newTitle) {
    setState(() {
      title = newTitle;
    });
  }

  void updateScreenCompletion(index, value) {
    setState(() {
      screens[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AiTripAppBar(
        title: title,
        currentPage: _currentPage,
        animateToPreviousPage: animateToPreviousPage,
      ),
      bottomNavigationBar: AiTripBottomAppBar(
        screens: screens,
        currentPage: _currentPage,
        animateToNextPage: animateToNextPage,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProgressBar(progressValue: _progressValue),
            Expanded(
              child: IndexedStack(
                index: _currentPage,
                children: [
                  Page1(
                    updateScreenCompletion: updateScreenCompletion,
                    currentPage: _currentPage,
                    animateToNextPage: animateToNextPage,
                    updateTitle: updateTitle,
                  ),
                  Page2(
                    updateScreenCompletion: updateScreenCompletion,
                  ),
                  const Page3(),
                  Page4(
                    updateScreenCompletion: updateScreenCompletion,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// appbar
class AiTripAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AiTripAppBar({
    super.key,
    required int currentPage,
    required this.animateToPreviousPage,
    required this.title,
  }) : _currentPage = currentPage;

  final int _currentPage;
  final Function(int) animateToPreviousPage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      centerTitle: false,
      shape: Border(
        bottom: BorderSide(width: 0, color: kPrimaryColor.withOpacity(0.1)),
      ),
      leading: IconButton(
        icon: const Icon(Icons.chevron_left_rounded),
        onPressed: () {
          if (_currentPage == 0) {
            Navigator.pop(context);
            return;
          }
          animateToPreviousPage(_currentPage - 1);
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(50)),
                height: 25,
                width: 25,
                child: const Icon(Icons.location_on_outlined, size: 15),
              ),
              const SizedBox(width: kDefaultPadding * 0.3),
              Text("Powered by AI",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold))
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

//bottom appbar
class AiTripBottomAppBar extends StatelessWidget {
  const AiTripBottomAppBar({
    super.key,
    required this.currentPage,
    required this.animateToNextPage,
    required this.screens,
  });
  final int currentPage;
  final Function(int) animateToNextPage;
  final List<bool> screens;

  @override
  Widget build(BuildContext context) {
    bool isComplete = false;

    switch (currentPage) {
      case 0:
        if (screens[0]) {
          isComplete = true;
        }
        break;
      case 1:
        if (screens[1]) {
          isComplete = true;
        }
        break;
      case 2:
        if (screens[2]) {
          isComplete = true;
        }
        break;
      case 3:
        if (screens[3]) {
          isComplete = true;
        }
        break;
    }

    return BottomAppBar(
      surfaceTintColor: Colors.white,
      child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SizedBox(
              height: 50,
              width: 100,
              child: FilledButton(
                  onPressed: isComplete
                      ? () {
                          if (currentPage + 1 == 4) return;
                          animateToNextPage(currentPage + 1);
                        }
                      : null,
                  child: const Text("Next")))),
    );
  }
}
