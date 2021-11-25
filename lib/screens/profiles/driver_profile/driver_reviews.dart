import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/widgets/rating_bars.dart';
import 'package:clean_app/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DriverReviews extends StatelessWidget {
  const DriverReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Rating delivery company',
                style: getRegularStyle(
                    fontSize: 18, color: ColorManager.lightGrey)),
          ),
          _starsAndRate(),
          SizedBox(height: 30),
          _ratingBars(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1,
            ),
          ),
          Text('Rate driver work',
              style:
                  getRegularStyle(fontSize: 18, color: ColorManager.lightGrey)),
          SizedBox(height: 20),
          ratingRow('Speed', '70% fast', '30% slow'),
          ratingRow('Communication', '30% good', '70% Bad'),
          ratingRow('Commitment', '30% No commitment', '70% commitment'),
          _statistics()
        ],
      ),
    );
  }

  Widget _starsAndRate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingRow(),
        SizedBox(width: 10),
        Text('(49) review'),
      ],
    );
  }

  Widget _ratingBars() {
    return CustomRatingBars(2, 7, 15, 40, 80);
  }

  Widget _statistics() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lightGrey),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Better driver 20',
            style: getRegularStyle(),
          ),
          VerticalDivider(thickness: 1),
          Text(
            'Points 3500',
            style: getRegularStyle(),
          ),
        ],
      ),
    );
  }
}
