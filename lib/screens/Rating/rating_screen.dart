import 'dart:developer';

import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/Rating/delivery_rating.dart';
import 'package:clean_app/screens/Rating/rating_stores.dart';
import 'package:clean_app/widgets/card_widget.dart';
import 'package:clean_app/widgets/counter_buttons.dart';
import 'package:clean_app/widgets/custom_toggle_buttons.dart';
import 'package:clean_app/widgets/image_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  late final _ratingTabs = [
    ToggleItemDataWithWidget(
        title: 'Stores',
        onPressed: () {
          changeSelectedTab(0);
        },
        page: RatingStores()),
    ToggleItemDataWithWidget(
        title: 'Delivery',
        onPressed: () {
          changeSelectedTab(1);
        },
        page: DeliveryRating()),
  ];
  int selectedTab = 0;
  void changeSelectedTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Review',
            style: getSemiBoldStyle(fontSize: 22, color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            _tabs(),
            Expanded(child: _ratingTabs[selectedTab].page),
          ],
        ),
      )),
    );
  }

  Widget _tabs() {
    return CustomToggleButtons(
      tabs: _ratingTabs,
      selectedIndex: selectedTab,
    );
  }
}
