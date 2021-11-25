import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/widgets/card_widget.dart';
import 'package:clean_app/widgets/counter_buttons.dart';
import 'package:clean_app/widgets/image_rounded.dart';
import 'package:clean_app/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStores extends StatelessWidget {
  const RatingStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: (height * 0.18), child: _rateStores()),
              _storeOwner(),
              _writeReview(),
              _ratingService(),
              SizedBox(height: height * 0.27, child: _ratingProducts()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultButton(onPressed: () {}, text: 'Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rateStores() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Text(
            'Rate stores',
            style: getRegularStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => CardWidget(
                width: MediaQuery.of(context).size.width * 0.24,
                imagePath: 'asset/images/starbucks.png',
                title: 'Starbucks',
                bottom: Container(),
              ),
            ),
          )
        ],
      );
    });
  }

  Widget _storeOwner() {
    return Row(children: [
      Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('asset/images/store_owner.png'),
          )),
      Expanded(
        flex: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('115223',
                style: getRegularStyle(color: ColorManager.lightGrey)),
            Text('Mohamed al 3li', style: getSemiBoldStyle(fontSize: 19)),
            Text('Store owner',
                style: getRegularStyle(color: ColorManager.lightGrey)),
          ],
        ),
      ),
      Expanded(
          flex: 2,
          child: CounterButtons(
            maxVal: 5,
            onCounterChange: (x) {
              print(x);
            },
          ))
    ]);
  }

  Widget _writeReview() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Write review',
              style: getRegularStyle(fontSize: 18, color: Colors.black)),
          SizedBox(height: 10),
          TextFormField(
            maxLines: 3,
            minLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          )
        ],
      );
    });
  }

  Widget _ratingService() {
    return Column(
      children: [
        Text(
          'Service Rating',
          style: getRegularStyle(fontSize: 18),
        ),
        RatingRow.interact(onPressed: (x) {}),
      ],
    );
  }

  Widget _ratingProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate products',
          style: getRegularStyle(fontSize: 18),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => _Product(
                imagePath: 'asset/images/product.png', name: 'Product name'),
          ),
        )
      ],
    );
  }
}

class _Product extends StatelessWidget {
  const _Product({Key? key, required this.imagePath, required this.name})
      : super(key: key);
  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.3,
      child: Column(
        children: [
          Expanded(flex: 5, child: _image()),
          Text(
            name,
            style: getSemiBoldStyle(fontSize: 14),
          ),
          SizedBox(height: 7),
          Expanded(
            child: _attributeButton('Good', Colors.green),
          ),
          SizedBox(height: 7),
          Expanded(
            child: _attributeButton('Bad', Colors.red),
          )
        ],
      ),
    );
  }

  ElevatedButton _attributeButton(String title, Color color) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        title,
        style: getRegularStyle(fontSize: 14, color: Colors.white),
      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
    );
  }

  RoundedImage _image() {
    return RoundedImage(
      imagePath: imagePath,
      radius: 10,
      width: double.infinity,
    );
  }
}
