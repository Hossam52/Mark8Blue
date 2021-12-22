import 'package:common_widgets/counter_buttons.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _productImage(),
            _productName(),
            SizedBox(height: 10),
            _productRating(),
            SizedBox(height: 10),
            _productSelection(),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Image.asset(
      'asset/images/shoes.png',
      width: double.infinity,
      height: 220,
      fit: BoxFit.fill,
    );
  }

  Widget _productName() {
    return Builder(builder: (context) {
      return Text(
        'Running Shoes',
        style: getSemiBoldStyle(
            fontSize: 24, color: Theme.of(context).primaryColor),
      );
    });
  }

  Widget _productRating() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text('Good 30%',
            style: getRegularStyle(fontSize: 20, color: Colors.green)),
        SizedBox(width: 20),
        Text('Bad 70%',
            style: getRegularStyle(fontSize: 20, color: Colors.red)),
      ]),
    );
  }

  Widget _productSelection() {
    return Builder(builder: (context) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product description',
                style: getSemiBoldStyle(
                    color: Theme.of(context).primaryColor, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '100% original products This item is not returnable. Items like inner-wear personal caare, make-up, socks',
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: getRegularStyle(),
                ),
              ),
              SizedBox(height: 20),
              _chooseSizes(),
              Divider(),
              _discountType(),
              SizedBox(height: 20),
              _quantityAndTotalPrice(),
              SizedBox(height: 20),
              _totalWeight(),
              SizedBox(height: 20),
              DefaultButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Add product',
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _chooseSizes() {
    final colorTabs = [
      ToggleItemData(title: 'Black', onPressed: () {}),
      ToggleItemData(title: 'Red', onPressed: () {}),
      ToggleItemData(title: 'Purple', onPressed: () {}),
    ];
    final sizesTabs = [
      ToggleItemData(title: 'Small', onPressed: () {}),
      ToggleItemData(title: 'Medium', onPressed: () {}),
      ToggleItemData(title: 'Large', onPressed: () {}),
    ];
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              'Choose size',
              style: getRegularStyle(
                  fontSize: 19, color: Theme.of(context).primaryColor),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomToggleButtons(tabs: colorTabs),
                  Divider(),
                  CustomToggleButtons(tabs: sizesTabs),
                ],
              ))
        ],
      );
    });
  }

  Widget _discountType() {
    return Row(
      children: [
        Text('Special type', style: getRegularStyle(fontSize: 18)),
        SizedBox(width: 20),
        Text('Discount 50 %', style: getRegularStyle(fontSize: 18)),
      ],
    );
  }

  Widget _quantityAndTotalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text('Quantity', style: getRegularStyle(fontSize: 18))),
        CounterButtons(onCounterChange: (x) {}),
        SizedBox(width: 10),
        Expanded(
            flex: 2,
            child: Text('Total price 60 D.A',
                style: getRegularStyle(fontSize: 18)))
      ],
    );
  }

  Widget _totalWeight() {
    return Row(
      children: [
        Text('Total weight 60', style: getRegularStyle(fontSize: 18)),
        Text(
          'kg',
          style: getRegularStyle(),
        ),
        Spacer(),
        Text(
          'Price after discount ',
          style: getRegularStyle(fontSize: 18),
        ),
        Text('30 D.A', style: getRegularStyle(color: Colors.red)),
      ],
    );
  }
}
