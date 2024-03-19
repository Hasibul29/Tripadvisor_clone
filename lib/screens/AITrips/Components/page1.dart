import 'package:flutter/material.dart';

import '../../../common/custom_alert_dialog.dart';
import '../../../constants.dart';
import '../../search_widget.dart';

class Page1 extends StatefulWidget {
  const Page1({
    super.key,
    required this.animateToNextPage,
    required this.currentPage,
    required this.updateTitle,
    required this.updateScreenCompletion,
  });
  final int currentPage;
  final Function(int) animateToNextPage;
  final Function(String) updateTitle;
  final Function(int,bool) updateScreenCompletion;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: size.height,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: kDefaultPadding),
          Text(
            "Where do you want to go?",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPadding),
          Row(
            children: [
              const Text("City/Town"),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CustomAlertDialog(
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla posuere leo mollis orci pulvinar, sit amet egestas arcu auctor.',
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.info_outline)),
            ],
          ),
          CustomSearchBar(hintText: "Search", controller: _controller),
          const SizedBox(height: kDefaultPadding),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 14,
              itemBuilder: ((context, index) {
                return LocationListTile(
                  imagePath: "assets/images/image1.jpg",
                  title: "FORM Hotel Dubai",
                  location: "Dubai, United Arab Emirates",
                  onPressed: () {
                    setState(() {
                      _controller.text = "FORM Hotel Dubai";
                      widget.updateTitle("FORM Hotel Dubai");
                      widget.animateToNextPage(widget.currentPage + 1);
                      widget.updateScreenCompletion(0,true);
                    });
                  },
                );
              }),
            ),
          )
        ]),
      ),
    );
  }
}

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.controller,
  });
  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: kDefaultPadding * 0.3),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: widget.controller,
              decoration: InputDecoration(
                  hintText: widget.hintText, border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}
