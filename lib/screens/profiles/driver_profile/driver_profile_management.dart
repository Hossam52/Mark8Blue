import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/screens/profiles/driver_profile/driver_reviews_management.dart';
import 'package:clean_app/screens/profiles/store_profiles/store_profile.dart';
import 'package:clean_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DriverProfileManagement extends StatelessWidget {
  DriverProfileManagement({Key? key}) : super(key: key) {
    storeInformations = [
      StoreProfileScreen(
        imagePath: 'asset/images/userProfile.png',
        detailsTable: driverDetailsTable,
        coverImagePath: 'asset/images/company_cover.png',
        title: 'Driver Details',
      ),
      StoreProfileScreen(
        imagePath: 'asset/images/company_profile.png',
        detailsTable: comapnyDetailsTable,
        coverImagePath: 'asset/images/company_cover.png',
        title: 'Company Details',
      ),
      StoreProfileScreen(
        imagePath: 'asset/images/vehicle_profile.png',
        detailsTable: vehicleDetailsTable,
        coverImagePath: 'asset/images/vehicle_cover.png',
        title: 'Vehicle details',
        showDiscription: false,
      ),
      DriverReviewsManagement(),
    ];
  }

  final driverInformation = [
    TableRowItem(title: 'Employment number', widget: Text('225547')),
    TableRowItem(title: 'Name', widget: Text('محمد علي')),
    TableRowItem(title: 'Type', widget: Text('Store owner')),
    TableRowItem(title: 'Work', widget: Text('Resturant owner')),
    TableRowItem(title: 'Age', widget: Text('30')),
    TableRowItem(title: 'Gender', widget: Text('Male')),
    TableRowItem(title: 'Experience', widget: Text('7')),
    TableRowItem(title: 'Nationality', widget: Text('Jordan')),
    TableRowItem(title: 'Points', widget: Text('2000')),
    TableRowItem(title: 'Best buyer', widget: Text('100')),
  ];
  late final TableDataWidget driverDetailsTable =
      TableDataWidget(rows: driverInformation);
  final companyInformation = [
    TableRowItem(title: 'Company name', widget: Text('DHL')),
    TableRowItem(title: 'Delivery type', widget: Text('Logistic service')),
    TableRowItem(title: 'Number vehicles', widget: Text('100')),
    TableRowItem(
        title: 'Rating',
        widget: RatingBarIndicator(
          itemCount: 5,
          rating: 4,
          itemSize: 27,
          itemBuilder: (_, index) {
            return Icon(
              Icons.star,
              color: Colors.amber,
            );
          },
        )),
  ];
  late final TableDataWidget comapnyDetailsTable =
      TableDataWidget(rows: companyInformation);

  final vehicleInformation = [
    TableRowItem(title: 'Vehicle type', widget: Text('DHL')),
    TableRowItem(title: 'Model', widget: Text('2012')),
    TableRowItem(title: 'Load/Order', widget: Text('30KG')),
    TableRowItem(title: 'Vehicle classification', widget: Text('Bike')),
    TableRowItem(title: 'Pannel number', widget: Text('1-s5547')),
    TableRowItem(title: 'Owner', widget: Text('Driver')),
  ];
  late final TableDataWidget vehicleDetailsTable =
      TableDataWidget(rows: vehicleInformation);
  late final List<Widget> storeInformations;
  final _pagesController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: _pagesController, children: storeInformations),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                controller: _pagesController,
                count: storeInformations.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: DefaultButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Select',
              ),
            )
          ],
        ),
      ),
    );
  }
}
