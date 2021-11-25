import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/widgets/border_container_light.dart';
import 'package:clean_app/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Morag3atWidget extends StatelessWidget {
  const Morag3atWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) => _ReviewItem(
            name: 'Mohamed Ali',
            description:
                'This is description This is description This is description This is description This is description This is description This is description This is description This is description',
            date: '15/9/2021',
            time: '10:00 AM'));
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem(
      {Key? key,
      required this.name,
      this.rate = 0,
      required this.description,
      required this.date,
      required this.time})
      : super(key: key);
  final String name;
  final double rate;
  final String description;
  final String date;
  final String time;

  final double _rating = 4;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: BorderContainerLight(
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: _personImage(),
                ),
                Expanded(flex: 4, child: _reviewData())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _personImage() {
    return FittedBox(
      child: CircleAvatar(
        backgroundImage: AssetImage('asset/images/userProfile.png'),
      ),
    );
  }

  Widget _reviewData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _nameAndDate(),
          _ratingIndicator(),
          _discription(),
          _time(),
        ],
      ),
    );
  }

  Widget _nameAndDate() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: getRegularStyle(fontSize: 19)),
          Text(date,
              style: getLightStyle(
                  fontSize: 19, color: Theme.of(context).primaryColor)),
        ],
      );
    });
  }

  Widget _ratingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RatingRow(
        size: 18.w,
      ),
    );
  }

  Widget _discription() {
    return Text(description,
        maxLines: 3,
        textAlign: TextAlign.start,
        style: getRegularStyle(fontSize: 13, color: ColorManager.lightGrey));
  }

  Widget _time() {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(time, style: getRegularStyle()));
  }
}
