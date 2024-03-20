import 'package:flutter/material.dart';

import '../../../constants.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key, required this.updateScreenCompletion});
  final Function(int, bool) updateScreenCompletion;

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int selectedIndex = 0;
  bool type1True = false;

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
              "How do you want to spend your time?",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: kDefaultPadding),
            const Text("Choose as many as you'd like"),
            const SizedBox(height: kDefaultPadding),
            Wrap(
              runSpacing: kDefaultPadding * 0.5,
              children: [
                CatagoryButton(
                    type1True: type1True,
                    index: 0,
                    updateScreenCompletion: widget.updateScreenCompletion),
                const SizedBox(width: kDefaultPadding),
                CatagoryButton(
                    type1True: type1True,
                    index: 1,
                    updateScreenCompletion: widget.updateScreenCompletion),
              ],
            ),
            const SizedBox(height: kDefaultPadding * 0.5),
            CatagoryButton(
                type1True: type1True,
                index: 2,
                updateScreenCompletion: widget.updateScreenCompletion),
            const SizedBox(height: kDefaultPadding * 0.5),
            CatagoryButton(
                type1True: type1True,
                index: 3,
                updateScreenCompletion: widget.updateScreenCompletion),
            const SizedBox(height: kDefaultPadding * 0.5),
            CatagoryButton(
                type1True: type1True,
                index: 4,
                updateScreenCompletion: widget.updateScreenCompletion),
            const SizedBox(height: kDefaultPadding * 0.5),
            Wrap(
              runSpacing: kDefaultPadding * 0.5,
              children: [
                CatagoryButton(
                    type1True: type1True,
                    index: 5,
                    updateScreenCompletion: widget.updateScreenCompletion),
                const SizedBox(width: kDefaultPadding),
                CatagoryButton(
                    type1True: type1True,
                    index: 6,
                    updateScreenCompletion: widget.updateScreenCompletion),
              ],
            ),
            const SizedBox(height: kDefaultPadding * 0.5),
            CatagoryButton(
                type1True: type1True,
                index: 7,
                updateScreenCompletion: widget.updateScreenCompletion),
            const SizedBox(height: kDefaultPadding * 0.5),
            CatagoryButton(
                type1True: type1True,
                index: 8,
                updateScreenCompletion: widget.updateScreenCompletion),
            const SizedBox(height: kDefaultPadding * 0.5),
            CatagoryButton(
                type1True: type1True,
                index: 9,
                updateScreenCompletion: widget.updateScreenCompletion),
            const SizedBox(height: kDefaultPadding * 0.5),
            Wrap(
              runSpacing: kDefaultPadding * 0.5,
              children: [
                CatagoryButton(
                    type1True: type1True,
                    index: 10,
                    updateScreenCompletion: widget.updateScreenCompletion),
                const SizedBox(width: kDefaultPadding),
                CatagoryButton(
                    type1True: type1True,
                    index: 11,
                    updateScreenCompletion: widget.updateScreenCompletion),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            const Text("Other (optional)"),
            TextFormField(
              maxLength: 50,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    type1True = false;
                  });
                  int c = 0;
                  for (var cat in tourCategories) {
                    if (cat.isSelected == true) c++;
                  }
                  if (c == 0) widget.updateScreenCompletion(3, false);
                } else if (value.length == 1) {
                  setState(() {
                    type1True = true;
                  });
                  widget.updateScreenCompletion(3, true);
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nightlife, Spas, Shopping",
                helperText: "Separate each entry with a comma",
              ),
            ),
            const SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}

class CatagoryButton extends StatefulWidget {
  const CatagoryButton({
    super.key,
    required this.index,
    required this.updateScreenCompletion,
    required this.type1True,
  });
  final int index;
  final bool type1True;
  final Function(int, bool) updateScreenCompletion;

  @override
  State<CatagoryButton> createState() => _CatagoryButtonState();
}

class _CatagoryButtonState extends State<CatagoryButton> {
  bool isSelected = false;
  bool updated = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: tourCategories[widget.index].isSelected
                    ? Colors.black
                    : Colors.grey.shade300)),
        onPressed: () {
          setState(() {
            tourCategories[widget.index].isSelected =
                !tourCategories[widget.index].isSelected;
          });
          int c = 0;
          for (var cat in tourCategories) {
            if (cat.isSelected == true) c++;
          }
          updated = true;
          if (c == 0) updated = false;

          if (isSelected != updated && !(isSelected && widget.type1True)) {
            // if(isSelected &&widget.type1True)
            widget.updateScreenCompletion(3, !isSelected);
          }
          isSelected = updated;
        },
        child: Text(
          tourCategories[widget.index].text,
          style: const TextStyle(fontSize: 10),
        ));
  }
}
