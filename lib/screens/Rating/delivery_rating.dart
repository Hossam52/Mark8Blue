import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/Rating/rating_stores.dart';
import 'package:clean_app/widgets/counter_buttons.dart';
import 'package:clean_app/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryRating extends StatelessWidget {
  const DeliveryRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rate Driving', style: getRegularStyle(fontSize: 20)),
            SizedBox(height: 8),
            _driverAct(),
            SizedBox(height: 8),
            _deliveryCompanyRating(),
            SizedBox(height: 8),
            _writeReview(),
            SizedBox(height: 8),
            _ratingService(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DefaultButton(
                onPressed: () {},
                text: 'Send',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _driverAct() {
    return Builder(builder: (context) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        // decoration: BoxDecoration(
        // border:
        //     Border.all(color: Theme.of(context).primaryColor, width: 2.5),
        // borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Driver act', style: getBoldStyle(fontSize: 18)),
            _storeOwner(),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.125,
                child: _ratingFeatures()),
          ],
        ),
      );
    });
  }

  Widget _storeOwner() {
    return Row(children: [
      Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('asset/images/store_owner.png'),
          )),
      Expanded(
        flex: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('115223',
                style: getRegularStyle(color: ColorManager.lightGrey)),
            Text('Mohamed al 3li', style: getSemiBoldStyle(fontSize: 19)),
            Text('Store owner',
                style: getRegularStyle(color: ColorManager.lightGrey)),
          ],
        ),
      ),
      Expanded(
          flex: 2,
          child: CounterButtons(
            maxVal: 5,
            onCounterChange: (x) {
              print(x);
            },
          ))
    ]);
  }

  Widget _ratingFeatures() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildColumn('Fast', () {}, () {}),
        _buildColumn('Communiccation', () {}, () {}),
        _buildColumn('Commitment', () {}, () {}),
      ],
    );
  }

  Widget _buildColumn(
      String title, VoidCallback onFastClicked, VoidCallback onSlowClicked) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: getRegularStyle(fontSize: 13),
          ),
          Expanded(
            // height: 20,
            child: ElevatedButton(
              onPressed: onFastClicked,
              child: Text('Fast'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            // height: 20,
            child: ElevatedButton(
              onPressed: onSlowClicked,
              child: Text('Slow'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _deliveryCompanyRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Delivery company rating', style: getRegularStyle(fontSize: 18)),
        Row(
          children: [
            Expanded(
              child: FittedBox(
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('asset/images/vehicle_profile.png'),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Center(
                    child: Text(
                  'DHL Company',
                  style: getRegularStyle(fontSize: 18),
                ))),
            Expanded(
                flex: 2,
                child: Text(
                  'Logistic company',
                  style: getRegularStyle(fontSize: 18),
                )),
          ],
        )
      ],
    );
  }

  Widget _writeReview() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Write review',
              style: getRegularStyle(fontSize: 18, color: Colors.black)),
          SizedBox(height: 10),
          TextFormField(
            maxLines: 3,
            minLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          )
        ],
      );
    });
  }

  Widget _ratingService() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Service Rating',
            style: getRegularStyle(fontSize: 18),
          ),
          RatingRow.interact(onPressed: (x) {}),
        ],
      ),
    );
  }
}
