import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/presentation/resourses/values.dart';
import 'package:clean_app/screens/profiles/store_profiles/store_profile_management.dart';
import 'package:clean_app/widgets/card_widget.dart';
import 'package:clean_app/widgets/choosen_stores.dart';
import 'package:clean_app/widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreMapLocations extends StatelessWidget {
  const StoreMapLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [_buildMap(), _data()],
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Image.asset(
      'asset/images/maps.png',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  Widget _data() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [_marketDetails(), Spacer(), _choosenStores()],
      ),
    );
  }

  Widget _marketDetails() {
    return Builder(builder: (context) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Column(
            children: [
              _marketName(),
              Divider(thickness: 1.5, color: Theme.of(context).primaryColor),
              _marketType(),
              Divider(thickness: 1.5, color: Theme.of(context).primaryColor),
              _sellingType(),
              SizedBox(height: 10)
            ],
          ),
        ),
      );
    });
  }

  Widget _marketName() {
    return Builder(builder: (context) {
      return Row(
        children: [
          BackButton(color: Theme.of(context).primaryColor),
          Text('Al salt Market', style: getRegularStyle(fontSize: 18)),
          Spacer(),
          Text('3 KM', style: getLightStyle(fontSize: 18))
        ],
      );
    });
  }

  Widget _choosenStores() {
    return Builder(builder: (context) {
      return Column(
        children: [
          _selectedStores(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DefaultButton(
              onPressed: () {
                Navigator.pop(context); //To go to add order store choosen
              },
              text: 'Done choosing',
            ),
          )
        ],
      );
    });
  }

  Widget _selectedStores() {
    return ChoosenStoresWidget();

    return Builder(builder: (context) {
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: height * 0.28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Choosen stores: 3', style: getRegularStyle(fontSize: 18)),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        To(context, StoreManagement());
                      },
                      child: CardWidget(
                        imagePath: 'asset/images/macdonals.png',
                        title: 'Macdonals',
                        width: width / 3,
                        bottom: Container(),
                        delelteItemCallBack: () {},
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _marketType() {
    final tabs = [
      ToggleItemData(title: 'Foods', onPressed: () {}),
      ToggleItemData(title: 'Clothes', onPressed: () {}),
      ToggleItemData(title: 'Furniture', onPressed: () {}),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Store type 3',
          style: getRegularStyle(fontSize: 17),
        ),
        CustomToggleButtons(tabs: tabs),
      ],
    );
  }

  Widget _sellingType() {
    final tabs = [
      ToggleItemData(title: 'Resturants', onPressed: () {}),
      ToggleItemData(title: 'Grocceary', onPressed: () {}),
      ToggleItemData(title: 'Coffe', onPressed: () {}),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Selling type 3'),
        CustomToggleButtons(tabs: tabs),
      ],
    );
  }
}
