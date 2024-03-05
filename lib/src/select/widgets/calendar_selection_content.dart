import 'package:flutter/material.dart';

class CalendarSelectionContent extends StatelessWidget {
  final DateTime dateTime;
  final _weekTexts = const ["日", "一", "二", "三", "四", "五", "六"];
  const CalendarSelectionContent({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    var temp = DateTime(dateTime.year, dateTime.month);
    print("查看$temp");
    print(temp.weekday);
    int start = 6 == temp.weekday ? 0 : -temp.weekday;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.biggest.width / 7;
        // var height = (constraints.biggest.height - 6) / 7;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2),
              padding: EdgeInsets.only(top: 18, bottom: 6),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _weekTexts.map((item) {
                  return SizedBox(
                    width: width,
                    child: Center(
                      child: Text(
                        item,
                        style: TextStyle(),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            ...List.generate(
              5,
              (tr) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (td) {
                  var dayDate = temp.add(Duration(days: start + tr * 7 + td));
                  return Text("$start.${dayDate.day}");
                }),
              ),
            )
          ],
        );
      },
    );
  }
}
