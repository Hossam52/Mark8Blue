import 'package:flutter/material.dart';

class CustomRatingBars extends StatelessWidget {
  const CustomRatingBars(this.oneStar, this.twoStars, this.threeStars,
      this.fourStars, this.fiveStars,
      {Key? key})
      : super(key: key);
  final double oneStar, twoStars, threeStars, fourStars, fiveStars;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      _rowRatingBar(5, fiveStars),
      _rowRatingBar(3, fourStars),
      _rowRatingBar(3, threeStars),
      _rowRatingBar(1, twoStars),
      _rowRatingBar(2, oneStar),
    ]);
  }

  Widget _rowRatingBar(int starNumber, double value) {
    return Row(
      children: [
        Expanded(child: Container()),
        Text(starNumber.toString()),
        SizedBox(width: 10),
        Expanded(
          flex: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Builder(builder: (context) {
              return Container(
                child: LinearProgressIndicator(
                  backgroundColor: Color(0xfff0f0f0),
                  color: Colors.amber,
                  value: value / 100,
                  minHeight: 8,
                ),
              );
            }),
          ),
        ),
        SizedBox(width: 10),
        Text('$value %'),
        Expanded(child: Container()),
      ],
    );
  }
}
