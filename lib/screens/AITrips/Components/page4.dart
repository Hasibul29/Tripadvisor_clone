import 'package:flutter/material.dart';

import '../../../constants.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int selectedIndex = 0;
  bool travellingWithChildren = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kDefaultPadding),
            Text(
              "Who's coming with you?",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: kDefaultPadding),
            SizedBox(
              height: 300,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: kDefaultPadding * 0.5,
                  crossAxisSpacing: kDefaultPadding * 0.5,
                ),
                itemCount: members.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.grey.shade300,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(19)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.purple.shade100.withOpacity(0.3)
                                  : null,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(members[index].icon, size: 30),
                          ),
                          const SizedBox(height: kDefaultPadding * 0.5),
                          Text(
                            members[index].text,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            selectedIndex >= 2
                ? Column(
                    children: [
                      Text(
                        "Are you travelling with children?",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Row(
                        children: [
                          Expanded(
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: travellingWithChildren
                                            ? Colors.black
                                            : Colors.grey.shade300),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      travellingWithChildren = true;
                                    });
                                  },
                                  child: const Text("YES"))),
                          const SizedBox(width: kDefaultPadding * 0.2),
                          Expanded(
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: travellingWithChildren
                                          ? Colors.grey.shade300
                                          : Colors.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      travellingWithChildren = false;
                                    });
                                  },
                                  child: const Text("NO"))),
                        ],
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
