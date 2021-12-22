import 'package:flutter/material.dart';
import 'package:clean_app/widgets/advertise_item.dart';
import 'package:common_widgets/appbar_with_toggle_buttons.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';

class AdvertisementScreen extends StatelessWidget {
  AdvertisementScreen({Key? key}) : super(key: key);
  final List<ToggleItemData> advertisementTypesTabs = [
    ToggleItemData(title: 'People advertisement', onPressed: () {}),
    ToggleItemData(title: 'Deliver advertisement', onPressed: () {}),
    ToggleItemData(title: 'Store advertisement', onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).primaryColor);
    return Column(
      children: [
        _buildAdvertisementTypes(context),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (index, _) => AdvertiseItem(),
          ),
        )
      ],
    );
  }

  Widget _buildAdvertisementTypes(BuildContext context) {
    final toggleButtons = CustomToggleButtons(
      tabs: advertisementTypesTabs,
    );
    return AppBarWithToggleButtons(toggleButtons: toggleButtons);
  }
}
