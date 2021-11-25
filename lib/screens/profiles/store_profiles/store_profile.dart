import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/widgets/border_container_light.dart';
import 'package:clean_app/widgets/cover_and_profile_image.dart';
import 'package:clean_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen(
      {Key? key,
      required this.title,
      required this.detailsTable,
      required this.coverImagePath,
      required this.imagePath,
      this.showDiscription = true})
      : super(key: key);

  final String title;
  final TableDataWidget detailsTable;
  final String coverImagePath;
  final String imagePath;
  final bool showDiscription;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CoverProfileImage(
            endWidget: BackButton(
              color: Theme.of(context).primaryColor,
            ),
            coverImagePath: coverImagePath,
            profileImagePath: imagePath,
            totalHeight: 200,
          ),
          SizedBox(height: 20),
          Text(title,
              style:
                  getRegularStyle(color: ColorManager.lightGrey, fontSize: 18)),
          detailsTable,
          if (showDiscription) _storeDescription()
        ],
      ),
    );
  }

  Widget _storeDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Store description', style: getRegularStyle(fontSize: 18)),
          Container(
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(minHeight: 100),
            child: BorderContainerLight(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hello This is description for the store hossam',
                  style: getRegularStyle(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
