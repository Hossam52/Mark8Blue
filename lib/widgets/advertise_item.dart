import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiseItem extends StatelessWidget {
  const AdvertiseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildAdvertiseImage('asset/images/advertise_image.png', context),
          _buildAdvertiseDiscription(),
          _buildAdvertiseActions(context)
        ],
      ),
    );
  }

  Widget _buildAdvertiseImage(String imagePath, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
    );
  }

  Widget _buildAdvertiseDiscription() {
    String advertiseData =
        '''Two days left for the 25 campaign Your request from a path gives you a great chance to win with us Do not forget if you were a student of the track and number 25 on Friday, so you will have the opportunity to choose between 👇😎 Golden ring or Fancy lunch for two or 200 shekels in cash Our application on your mobile ,, what do you want to ask and catch up with you''';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        advertiseData,
        textAlign: TextAlign.start,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: getLightStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildAdvertiseActions(context) {
    return Row(children: [
      Expanded(child: _buildViewers()),
      Expanded(flex: 2, child: _buildAdvTime(context)),
      Expanded(flex: 3, child: _buildContactsActions()),
    ]);
  }

  Widget _buildContactsActions() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Image.asset(
        'asset/images/twitter.png',
        scale: 0.75,
      ),
      Image.asset(
        'asset/images/facebook.png',
        scale: 0.75,
      ),
      Image.asset(
        'asset/images/instagram.png',
        scale: 0.75,
      ),
      Image.asset(
        'asset/images/call.png',
        scale: 0.75,
      ),
      Image.asset(
        'asset/images/map.png',
        scale: 0.75,
      ),
    ]);
  }

  Widget _buildAdvTime(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text('12:30 AM',
          style: getBoldStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.primary,
          )),
      Text('15-9-2021',
          style: getRegularStyle(
              fontSize: 14, color: Theme.of(context).colorScheme.primary)),
    ]);
  }

  Widget _buildViewers() {
    return Column(
      children: [
        Image.asset(
          'asset/images/view.png',
          width: 25.w,
          height: 25.w,
        ),
        Text(
          '200',
          style: getRegularStyle(fontSize: 16),
        ),
      ],
    );
  }
}
