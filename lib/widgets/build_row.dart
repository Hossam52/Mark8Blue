import 'package:flutter/material.dart';

class BuildRow extends StatelessWidget {
  const BuildRow(
      {Key? key,
      required this.title,
      required this.value,
      this.titleSpace = 1,
      this.valueSpace = 2})
      : super(key: key);
  final String title;
  final Widget value;
  final int titleSpace;
  final int valueSpace;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: titleSpace,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: valueSpace,
              child: Row(
                children: [
                  Expanded(child: Center(child: value)),
                ],
              ),
            ),
          ],
        ),
        Divider(),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
