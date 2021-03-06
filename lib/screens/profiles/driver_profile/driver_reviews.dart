import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/models/review_model.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:common_widgets/rating_bars.dart';
import 'package:common_widgets/rating_row.dart';
import 'package:flutter/material.dart';

class DriverReviews extends StatelessWidget {
  DriverReviews({Key? key, required this.driverReviewModel})
      : _speedBehavior = driverReviewModel.speed,
        _commitmentBehavior = driverReviewModel.commitment,
        _communicationBehavior = driverReviewModel.communication,
        super(key: key);
  final DriverReviewModel driverReviewModel;
  final SpeedBehavior _speedBehavior;
  final CommunicationBehavior _communicationBehavior;
  final CommitmentBehavior _commitmentBehavior;
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
          ratingRow(
              _speedBehavior.title, _speedBehavior.fast, _speedBehavior.slow),
          ratingRow(_communicationBehavior.title, _communicationBehavior.fast,
              _communicationBehavior.slow),
          ratingRow(_commitmentBehavior.title, _commitmentBehavior.fast,
              _commitmentBehavior.slow),
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
        Text('(${driverReviewModel.reviews} hello) review'),
      ],
    );
  }

  Widget _ratingBars() {
    print(driverReviewModel.ratingValues);
    return CustomRatingBars(
      driverReviewModel.ratingValues[0],
      driverReviewModel.ratingValues[1],
      driverReviewModel.ratingValues[2],
      driverReviewModel.ratingValues[3],
      driverReviewModel.ratingValues[4],
    );
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
            'Better driver ${driverReviewModel.betterDriver}',
            style: getRegularStyle(),
          ),
          VerticalDivider(thickness: 1),
          Text(
            'Points ${driverReviewModel.points}',
            style: getRegularStyle(),
          ),
        ],
      ),
    );
  }
}
