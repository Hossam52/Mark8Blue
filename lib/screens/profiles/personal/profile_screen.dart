import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/maps/address_location.dart';
import 'package:clean_app/screens/notifications/notification_screen.dart';
import 'package:common_widgets/cover_and_profile_image.dart';
import 'package:common_widgets/notification_badge.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:common_widgets/profile.dart';

class ProfileScreen extends StatelessWidget {
  List<TableRowItem> _personalData = [
    TableRowItem(title: 'Name', widget: Text('Hossam Hassan')),
    TableRowItem(title: 'ID', widget: Text('325')),
    TableRowItem(title: 'Age', widget: Text('30')),
    TableRowItem(title: 'Gender', widget: Text('Male')),
    TableRowItem(title: 'Nationality', widget: _buildNationality()),
    TableRowItem(title: 'Address', widget: _buildAddress()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ProfileStructure(
      profileData: ProfileDataConfigs(
          coverImagePath: 'asset/images/coverProfile.png',
          imagePath: 'asset/images/userProfile.png',
          showBackButton: false,
          detailsTable: _personalData,
          showDiscription: false,
          onNotificationPressed: () => {To(context, NotificationScreen())},
          onChangeCoverPicture: () {},
          onChangePersonalPicture: () {},
          tableValueSizeFactor: 8,
          tableTitleSizeFactor: 3),
    ));
  }

  static Widget _buildAddress() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Oman Makka st 16511, Doar el sha3b hady bady",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                To(context, DisplayCurrentLocation());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("asset/images/map.png"),
                  Text(
                    "On map",
                    style: getRegularStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  static Widget _buildNationality() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
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
      ),
    );
  }
}
