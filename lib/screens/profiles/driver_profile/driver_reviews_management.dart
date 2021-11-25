import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/screens/profiles/driver_profile/driver_reviews.dart';
import 'package:clean_app/widgets/morag3at.dart';
import 'package:clean_app/screens/profiles/store_profiles/reviews.dart';
import 'package:clean_app/widgets/card_widget.dart';
import 'package:clean_app/widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DriverReviewsManagement extends StatefulWidget {
  DriverReviewsManagement({Key? key}) : super(key: key);

  @override
  State<DriverReviewsManagement> createState() =>
      _DriverReviewsManagementState();
}

class _DriverReviewsManagementState extends State<DriverReviewsManagement> {
  @override
  void initState() {
    _reviewsTabs = [
      ToggleItemDataWithWidget(
          title: 'Reviews',
          onPressed: () => onChangeSelected(0),
          page: DriverReviews()),
      ToggleItemDataWithWidget(
          title: 'Morag3at',
          onPressed: () => onChangeSelected(1),
          page: Morag3atWidget()),
    ];
    super.initState();
  }

  late List<ToggleItemDataWithWidget> _reviewsTabs;

  int _selectedTabIndex = 0;

  void onChangeSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Text('Hello man')
          _toggleButtons(),
          Expanded(child: _reviewsTabs[_selectedTabIndex].page)
        ],
      ),
    );
  }

  Widget _toggleButtons() {
    return CustomToggleButtons(
        tabs: _reviewsTabs, selectedIndex: _selectedTabIndex);
  }
}