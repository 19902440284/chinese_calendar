import 'package:flutter/material.dart';

import 'index.dart';

class CalendarSelectionView extends StatefulWidget {
  ///日历开始时间
  final DateTime? startDateTime;

  ///日历结束时间
  final DateTime? endDateTime;

  const CalendarSelectionView({
    super.key,
    this.startDateTime,
    this.endDateTime,
  });

  Future<dynamic> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 334,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Material(
              child: this,
            ),
          ),
        );
      },
    );
  }

  @override
  State<CalendarSelectionView> createState() => _CalendarSelectionViewState();
}

class _CalendarSelectionViewState extends State<CalendarSelectionView> {
  //日历开始时间
  late DateTime _startDateTime;
  //日历结束时间
  late DateTime _endDateTime;
  //总共有多少个月
  late int monthCount;

  @override
  void initState() {
    super.initState();
    _startDateTime = widget.startDateTime ?? DateTime(1900);
    _endDateTime = widget.endDateTime ?? DateTime(2100);

    if (_startDateTime.year < 1900) {
      _startDateTime = DateTime(1900, 1, 1);
    }
    if (_endDateTime.year > 2100) {
      _endDateTime = DateTime(2100, 12, 31);
    }
    monthCount = (_endDateTime.year - _startDateTime.year) * 12 +
        _endDateTime.month -
        _startDateTime.month +
        1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: monthCount,
              itemBuilder: (_, index) {
                return CalendarSelectionContent(
                  dateTime: DateTime(_startDateTime.year + index ~/ 12,
                      _startDateTime.month + index % 12),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
