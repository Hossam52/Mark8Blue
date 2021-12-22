import 'package:common_widgets/morag3at.dart';
import 'package:clean_app/screens/profiles/store_profiles/reviews.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/morag3at_model.dart';
import 'package:flutter/material.dart';

class StoreReviews extends StatefulWidget {
  StoreReviews({Key? key}) : super(key: key);

  @override
  State<StoreReviews> createState() => _StoreReviewsState();
}

class _StoreReviewsState extends State<StoreReviews> {
  @override
  void initState() {
    _reviewsTabs = [
      ToggleItemDataWithWidget(
          title: 'Reviews',
          onPressed: () => onChangeSelected(0),
          page: ReviewsWidget()),
      ToggleItemDataWithWidget(
          title: 'Morag3at',
          onPressed: () => onChangeSelected(1),
          page: Morag3atWidget(
            morg3at: allMorg3at,
          )),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _toggleButtons(),
            Expanded(child: _reviewsTabs[_selectedTabIndex].page)
          ],
        ),
      ),
    );
  }

  Widget _toggleButtons() {
    return CustomToggleButtons(
        tabs: _reviewsTabs, selectedIndex: _selectedTabIndex);
  }
}
