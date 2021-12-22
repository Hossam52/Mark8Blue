import 'package:clean_app/general_commponent/components.dart';
import 'package:common_widgets/card_widget.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/product_details/product_details.dart';
import 'package:clean_app/widgets/choosen_stores.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:clean_app/widgets/store_owner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseOrderProducts extends StatelessWidget {
  ChooseOrderProducts({Key? key, required this.onNextButtonPressed})
      : super(key: key);
  final VoidCallback onNextButtonPressed;
  final List<ToggleItemData> mainDepartmentTabs = [
    ToggleItemData(title: 'Foods', onPressed: () {}),
    ToggleItemData(title: 'Clothes', onPressed: () {}),
    ToggleItemData(title: 'Furniture', onPressed: () {}),
  ];
  final List<ToggleItemData> branchDepartmentTabs = [
    ToggleItemData(title: 'Resturants', onPressed: () {}),
    ToggleItemData(title: 'Grocceary', onPressed: () {}),
    ToggleItemData(title: 'Coffe', onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        ChoosenStoresWidget(
          displayBottomWidget: true,
          height: height * 0.23,
        ),
        Divider(thickness: 1),
        StoreOwnerWidget(),
        _categories(),
        _products(primaryColor),
        _choosenProducts(height, primaryColor),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(
            onPressed: onNextButtonPressed,
            text: 'Next',
          ),
        )
      ],
    );
  }

  Widget _categories() {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Main department',
                style: getRegularStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              CustomToggleButtons(tabs: mainDepartmentTabs),
              divider(),
              Text(
                'Branch department',
                style: getRegularStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              CustomToggleButtons(tabs: branchDepartmentTabs),
            ],
          ),
        ),
      ),
    );
  }

  Widget _products(color) {
    return Builder(builder: (context) {
      final height = MediaQuery.of(context).size.height;
      return Card(
          elevation: 4,
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Products: ',
                        style: getRegularStyle(fontSize: 20),
                        children: [
                      TextSpan(
                          text: '1',
                          style: getRegularStyle(fontSize: 20, color: color))
                    ])),
                SizedBox(
                  height: height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) => Builder(builder: (context) {
                      return InkWell(
                        onTap: () => To(context, ProductDetails()),
                        child: _buildProductItem(context),
                      );
                    }),
                  ),
                ),
                // RichText(
                //     text: TextSpan(
                //         text: 'Special products ',
                //         style: getRegularStyle(fontSize: 20),
                //         children: [
                //       TextSpan(text: '1', style: TextStyle(color: color))
                //     ])),
                // SizedBox(
                //   height: height * 0.22,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 1,
                //     itemBuilder: (_, index) => Builder(builder: (context) {
                //       return InkWell(
                //           onTap: () {
                //             To(context, ProductDetails());
                //           },
                //           child: _buildProductItem(context));
                //     }),
                //   ),
                // ),
              ],
            ),
          ));
    });
  }

  CardWidget _buildProductItem(BuildContext context, {VoidCallback? onCancel}) {
    return CardWidget(
      width: MediaQuery.of(context).size.width * 0.3,
      imagePath: 'asset/images/shoes.png',
      title: 'Running shoes',
      bottom: _buildProductPrice(context),
      delelteItemCallBack: onCancel,
    );
  }

  Row _buildProductPrice(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          '40 JD',
          style: getRegularStyle(
              fontSize: 12, color: Theme.of(context).primaryColor),
        )),
        Expanded(
            child: Text(
          '40 JD',
          style: getRegularStyle(fontSize: 12, color: Colors.red),
        ))
      ],
    );
  }

  Widget _choosenProducts(double height, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: 'Choosen products ',
                  style: getRegularStyle(fontSize: 18),
                  children: [
                TextSpan(text: '1', style: TextStyle(color: color))
              ])),
          SizedBox(
            height: height * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (_, index) => Builder(builder: (context) {
                return _buildProductItem(context, onCancel: () {});
              }),
            ),
          ),
        ],
      ),
    );
  }
}
