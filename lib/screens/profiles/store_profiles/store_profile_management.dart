import 'package:clean_app/general_commponent/components.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/profiles/store_profiles/store_reviews.dart';

import 'package:common_widgets/indicator_widget.dart';
import 'package:common_widgets/profile.dart';
import 'package:common_widgets/rating_row.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:flutter/material.dart';

class StoreManagement extends StatelessWidget {
  final int initialIndex;
  StoreManagement({Key? key, this.initialIndex = 0}) : super(key: key) {
    storeInformations = [
      ProfileStructure(
          profileData: ProfileDataConfigs(
              coverImagePath: 'asset/images/coverProfile.png',
              detailsTable: storeInfo,
              imagePath: 'asset/images/userProfile.png',
              title: 'Store Details',
              tableValueSizeFactor: 6)),
      ProfileStructure(
          profileData: ProfileDataConfigs(
        coverImagePath: 'asset/images/coverProfile.png',
        detailsTable: buyerInfo,
        imagePath: 'asset/images/userProfile.png',
        title: 'Buyer Details',
        showDiscription: false,
      )),
      StoreReviews(),
    ];
  }

  final storeInfo = [
    TableRowItem(
        title: 'Store name',
        widget: Text(
          'Starbuck',
          style: getRegularStyle(fontSize: 16),
        )),
    TableRowItem(
        title: 'Store type',
        widget: Text(
          'Resturant',
          style: getRegularStyle(fontSize: 16),
        )),
    TableRowItem(
        title: 'Selling type',
        widget: Text(
          'Fast food',
          style: getRegularStyle(fontSize: 16),
        )),
    TableRowItem(title: 'Store address', widget: Text('Address')),
  ];
  final buyerInfo = [
    TableRowItem(title: 'Employment number', widget: Text('225547')),
    TableRowItem(title: 'Name', widget: Text('محمد علي')),
    TableRowItem(title: 'Type', widget: Text('Store owner')),
    TableRowItem(title: 'Work', widget: Text('Resturant owner')),
    TableRowItem(title: 'Age', widget: Text('30')),
    TableRowItem(title: 'Gender', widget: Text('Male')),
    TableRowItem(title: 'Experience', widget: Text('7')),
    TableRowItem(
      title: 'Nationality',
      widget: _nationality(),
    ),
    TableRowItem(title: 'Points', widget: Text('2000')),
    TableRowItem(title: 'Best buyer', widget: Text('100')),
  ];

  static Row _nationality() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Jordan",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getRegularStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
        buildIcon("asset/images/jordan.png", size: 25),
      ],
    );
  }

  late final List<Widget> storeInformations;
  late final _pagesController = PageController(initialPage: initialIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
                controller: _pagesController, children: storeInformations),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IndicatorWidget(
              pageController: _pagesController,
              count: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultButton(
              onPressed: () {
                Navigator.pop(context); //To go to store choosen from map
              },
              text: 'Select',
            ),
          )
        ],
      ),
    );
  }
}
