import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/profiles/store_profiles/store_profile.dart';
import 'package:clean_app/screens/profiles/store_profiles/store_reviews.dart';
import 'package:clean_app/widgets/cover_and_profile_image.dart';
import 'package:clean_app/widgets/rating_row.dart';
import 'package:clean_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timelines/timelines.dart';

class StoreManagement extends StatelessWidget {
  final int initialIndex;
  StoreManagement({Key? key, this.initialIndex = 0}) : super(key: key) {
    storeInformations = [
      StoreProfileScreen(
        coverImagePath: 'asset/images/coverProfile.png',
        detailsTable: storeInfoTable,
        imagePath: 'asset/images/userProfile.png',
        title: 'Store Details',
      ),
      StoreProfileScreen(
        coverImagePath: 'asset/images/coverProfile.png',
        detailsTable: buyerInfoTable,
        imagePath: 'asset/images/userProfile.png',
        title: 'Buyer Details',
        showDiscription: false,
      ),
      // BuyerProfile(),
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
    TableRowItem(title: 'Rating', widget: RatingRow(size: 25)),
    TableRowItem(title: 'Store address', widget: Text('Address')),
  ];
  late final TableDataWidget storeInfoTable = TableDataWidget(rows: storeInfo);

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

  late final TableDataWidget buyerInfoTable = TableDataWidget(rows: buyerInfo);

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
            child: SmoothPageIndicator(
              controller: _pagesController,
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
