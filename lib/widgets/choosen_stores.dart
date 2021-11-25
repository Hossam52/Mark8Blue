import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/profiles/store_profiles/store_profile_management.dart';
import 'package:clean_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosenStoresWidget extends StatelessWidget {
  const ChoosenStoresWidget(
      {Key? key, this.displayBottomWidget = false, this.height, this.itemWidth})
      : super(key: key);
  final bool displayBottomWidget;
  final double? height;
  final double? itemWidth;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height ?? screenHeight * 0.22,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: 'Choosen stores ',
                    style: getRegularStyle(fontSize: 16),
                    children: [
                  TextSpan(
                      text: '3',
                      style: getRegularStyle(fontSize: 18, color: color))
                ])),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    To(context, StoreManagement());
                  },
                  child: CardWidget(
                    width:
                        itemWidth ?? MediaQuery.of(context).size.width * 0.24,
                    delelteItemCallBack: () {
                      print('Hello');
                    },
                    imagePath: 'asset/images/macdonals.png',
                    title: 'Macdonals',
                    bottom: displayBottomWidget
                        ? Text(
                            'السلط',
                            style: getRegularStyle(fontSize: 11),
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
