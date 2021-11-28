import 'package:badges/badges.dart';
import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/maps/address_location.dart';
import 'package:clean_app/screens/notifications/notification_screen.dart';
import 'package:clean_app/widgets/cover_and_profile_image.dart';
import 'package:clean_app/widgets/notification_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // _buildBackgroundAndImage(),
            _coverProfileImage(),
            SizedBox(
              height: 20.h,
            ),
            _buildProfileData()
          ],
        ),
      ),
    );
  }

  CoverProfileImage _coverProfileImage() {
    return CoverProfileImage(
        totalHeight: 230.h,
        radius: 70.r,
        startWidget: NotificationBadge(
          onPressed: () => To(context, NotificationScreen()),
        ),
        changeProfilePictures: true,
        coverImagePath: 'asset/images/coverProfile.png',
        profileImagePath: 'asset/images/userProfile.png');
  }

  Widget _buildProfileData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildrowItem(title: 'Name', value: 'Hossam Hassan'),
          // _buildrowItem(title: 'Nick name', value: 'moh541'),
          _buildrowItem(title: 'ID', value: '325'),
          _buildrowItem(title: 'Age', value: '30'),
          _buildrowItem(title: 'Gender', value: 'Male'),
          _buildNationality(),
          _buildAddress(),
        ],
      ),
    );
  }

  Widget _buildrowItem({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildRow(
          value: Text(
            value,
            textAlign: TextAlign.end,
            style: getLightStyle(
              fontSize: 18,
            ),
          ),
          title: title),
    );
  }

  Widget _buildAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildRow(
        title: 'Address',
        value: Row(
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
      ),
    );
  }

  Widget _buildNationality() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildRow(
        title: 'Nationality',
        value: Row(
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
      ),
    );
  }
}
