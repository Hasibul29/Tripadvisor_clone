import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class Page2 extends StatefulWidget {
  const Page2({
    super.key,
    required this.updateScreenCompletion,
  });
  final Function(int, bool) updateScreenCompletion;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool isSelected = false;
  bool isDatePicked = false;
  void toggleSelection(bool newValue) {
    setState(() {
      isSelected = newValue;
    });
  }

  void updateDatePicked() {
    setState(() {
      isDatePicked = true;
    });
  }

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
              "When do you want to go?",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: kDefaultPadding),
            Text(
              "Choose a day/date range up to 7 days.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: kDefaultPadding),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.3),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(29)),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(40),
                            backgroundColor: isSelected ? null : Colors.white),
                        onPressed: () {
                          toggleSelection(false);
                          if (!isDatePicked) {
                            widget.updateScreenCompletion(1, false);
                          }
                        },
                        child: const Text("Dates (MM/DD)")),
                  ),
                  Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(40),
                            backgroundColor: isSelected ? Colors.white : null),
                        onPressed: () {
                          toggleSelection(true);
                          widget.updateScreenCompletion(1, true);
                        },
                        child: const Text("Trip Length")),
                  )
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            IndexedStack(
              index: isSelected ? 1 : 0,
              children: [
                DatePick(
                    updateScreenCompletion: widget.updateScreenCompletion,
                    updateDatePicked: updateDatePicked),
                const TripLength()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DatePick extends StatefulWidget {
  const DatePick({
    super.key,
    required this.updateScreenCompletion,
    required this.updateDatePicked,
  });
  final Function(int, bool) updateScreenCompletion;
  final VoidCallback updateDatePicked;

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  String datePick = "Start date -> End date";

  String formatDateRange(DateTime start, DateTime end) {
    String startMonthDay = DateFormat('MMMM d').format(start);
    String endMonthDay = DateFormat('MMMM d').format(end);
    return '$startMonthDay -> $endMonthDay';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final picked = await showDateRangePicker(
          context: context,
          lastDate: DateTime(2100),
          firstDate: DateTime.now(),
        );
        if (picked != null) {
          widget.updateDatePicked();
          String formattedDateRange = formatDateRange(picked.start, picked.end);
          setState(() {
            datePick = formattedDateRange;
            widget.updateScreenCompletion(1, true);
          });
        }
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const Icon(Icons.date_range),
              const SizedBox(width: kDefaultPadding),
              Text(datePick),
            ],
          ),
        ),
      ),
    );
  }
}

class TripLength extends StatefulWidget {
  const TripLength({super.key});

  @override
  State<TripLength> createState() => _TripLengthState();
}

class _TripLengthState extends State<TripLength> {
  int totaldays = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total days"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    disabledBackgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                  ),
                  onPressed: totaldays < 2
                      ? null
                      : () {
                          setState(() {
                            totaldays--;
                          });
                        },
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: kDefaultPadding * 0.5),
                Text(totaldays.toString()),
                const SizedBox(width: kDefaultPadding * 0.5),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    disabledBackgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      totaldays++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: kDefaultPadding * 2),
        const Text("During what month?(optional)"),
        const SizedBox(height: kDefaultPadding),
        const MonthSelect(),
      ],
    );
  }
}

class MonthSelect extends StatefulWidget {
  const MonthSelect({
    super.key,
  });

  @override
  State<MonthSelect> createState() => _MonthSelectState();
}

class _MonthSelectState extends State<MonthSelect> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: month.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index == selectedIndex ? -1 : index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_month),
                        Text(month[index]),
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
