import 'dart:math';

import 'package:clean_app/general_commponent/components.dart';
import 'package:common_widgets/border_container_light.dart';
import 'package:common_widgets/card_widget.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/presentation/resourses/values.dart';
import 'package:clean_app/screens/maps/store_map_locations.dart';
import 'package:clean_app/widgets/choosen_stores.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseOrderStores extends StatelessWidget {
  ChooseOrderStores({Key? key, required this.onNexPagePressed})
      : super(key: key);
  final VoidCallback onNexPagePressed;
  final List<ToggleItemData> buyFromTabs = [
    ToggleItemData(title: 'One store', onPressed: () {}),
    ToggleItemData(title: 'Multiple stores', onPressed: () {}),
  ];
  final List<ToggleItemData> recievingMethodTabs = [
    ToggleItemData(title: 'Delivery', onPressed: () {}),
    ToggleItemData(title: 'Monaola', onPressed: () {}),
  ];
  final List<ToggleItemData> _marketSystemTabs = [
    ToggleItemData(title: 'One Market', onPressed: () {}),
    ToggleItemData(title: 'Multiple Markets', onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buyFrom(),
          Divider(),
          _recieveingMethod(),
          Divider(),
          _recievingHeaderLabel(),
          _calender(),
          TimeSelection(),
          Divider(),
          _marketChoosenSystem(),
          SizedBox(height: height * 0.16, child: _stores(context)),
          ChoosenStoresWidget(),
          DefaultButton(
            onPressed: onNexPagePressed,
            text: 'Next',
          )
        ],
      ),
    );
  }

  Widget _buyFrom() {
    List<String> buyFromList = ['One store', 'More stores'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Want To buy from',
          style: getRegularStyle(color: Colors.black, fontSize: 18),
        ),
        CustomToggleButtons(tabs: buyFromTabs),
      ],
    );
  }

  Widget _recieveingMethod() {
    List<String> buyFromList = ['Delivery', 'Monaloa'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recieving method',
          style: getRegularStyle(fontSize: 18),
        ),
        CustomToggleButtons(tabs: recievingMethodTabs),
      ],
    );
  }

  Widget _recievingHeaderLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recieving order time',
          style: getRegularStyle(fontSize: 18),
        ),
        Text(
          'Mar,2021',
          style: getRegularStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _calender() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: BorderContainerLight(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              // height: MediaQuery.of(context).size.height * 0.16.h,
              child: DatePicker(
                DateTime.now(),
                dayTextStyle: getRegularStyle(fontSize: 15),
                dateTextStyle: getRegularStyle(fontSize: 15),
                monthTextStyle: getRegularStyle(fontSize: 15),
                daysCount: 7,
                // height: MediaQuery.of(context).size.height * 0.17.h,
                initialSelectedDate: DateTime.now().add(Duration(days: 2)),
                selectionColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _marketChoosenSystem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            'Market choosen system',
            style: getRegularStyle(fontSize: 18),
          ),
        ),
        Flexible(flex: 4, child: CustomToggleButtons(tabs: _marketSystemTabs))
      ],
    );
  }

  Widget _stores(context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                To(context, StoreMapLocations());
              },
              child: CardWidget(
                width: MediaQuery.of(context).size.width * 0.3,
                isSelected: Random.secure().nextBool(),
                imagePath: 'asset/images/macdonals.png',
                title: 'Khaled',
                // bottom: Text('Stores 50', style: getRegularStyle(fontSize: 13)),
                bottom: Container(),
              ),
            ));
  }
}

class TimeSelection extends StatefulWidget {
  const TimeSelection({Key? key}) : super(key: key);

  @override
  _TimeSelectionState createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  int hours = 13;
  int minutes = 30;
  bool isAM = false;
  @override
  Widget build(BuildContext context) {
    return BorderContainerLight(child: Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '$hours : $minutes ${isAM ? 'AM' : 'PM'}',
                style: TextStyle(
                    fontSize: 20.sp, color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _timeColumn('$hours', () {
                    setState(() {
                      hours = (hours + 1) % 24;
                    });
                  }, () {
                    setState(() {
                      if (hours == 0) {
                        hours = 24;
                      }
                      hours = (hours - 1).abs() % 24;
                    });
                  }),
                  _timeColumn('$minutes', () {
                    setState(() {
                      minutes = (minutes + 1) % 60;
                    });
                  }, () {
                    setState(() {
                      if (minutes == 0) minutes = 60;
                      minutes = (minutes - 1).abs() % 60;
                    });
                  }),
                  _timeColumn(isAM ? 'AM' : 'PM', () {
                    setState(() {
                      isAM = !isAM;
                    });
                  }, () {
                    setState(() {
                      isAM = !isAM;
                    });
                  }),
                ],
              ),
            )
          ],
        ),
      );
    }));
  }

  Widget _timeColumn(
      String display, VoidCallback increase, VoidCallback decrease) {
    return Column(
      children: [
        InkWell(onTap: increase, child: Icon(Icons.keyboard_arrow_up)),
        Text(
          display,
          style: TextStyle(fontSize: 20.sp),
        ),
        InkWell(onTap: decrease, child: Icon(Icons.keyboard_arrow_down))
      ],
    );
  }
}
