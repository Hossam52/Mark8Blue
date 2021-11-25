import 'package:clean_app/general_commponent/colors.dart';
import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/profiles/driver_profile/driver_profile_management.dart';
import 'package:clean_app/widgets/card_widget.dart';
import 'package:clean_app/widgets/custom_toggle_buttons.dart';
import 'package:clean_app/widgets/image_rounded.dart';
import 'package:clean_app/widgets/store_owner_widget.dart';
import 'package:flutter/material.dart';

class PrepareOrders extends StatefulWidget {
  const PrepareOrders({Key? key}) : super(key: key);

  @override
  State<PrepareOrders> createState() => _PrepareOrdersState();
}

class _PrepareOrdersState extends State<PrepareOrders> {
  int orderIndex = 0;

  int storeIndex = 0;

  int driverIndex = 0;

  List<StoreData> stores = [
    StoreData('asset/images/macdonals.png', 'Macdonals', 3, 3, true, true),
    StoreData('asset/images/starbucks.png', 'Starbucls', 2, 3, false, false),
    StoreData('asset/images/kfc.png', 'KFC', 2, 3, false, false),
  ];
  List<OrderPreparing> ordrs = [
    OrderPreparing(
        '5544123699', 'asset/images/green_bag.png', 'Ready', false, true),
    OrderPreparing(
        '5544123699', 'asset/images/green_bag.png', 'preparing', false, true),
    OrderPreparing(
        '5544123699', 'asset/images/red_bag.png', 'Ready', true, false),
    OrderPreparing(
        '5544123699', 'asset/images/red_bag.png', 'Ready', false, false),
  ];

  List<DriverData> drivers = [
    DriverData('asset/images/macdonals.png', 'Mohamed ali', 3, 3, 200, true),
    DriverData('asset/images/starbucks.png', 'Hossam Hassan', 2, 3, 200, false),
    DriverData('asset/images/kfc.png', 'Ahmed Ashraf', 2, 3, 200, false),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0)
              .copyWith(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Orders being prepared',
                  style: getRegularStyle(fontSize: 18)),
              SizedBox(height: height * 0.16, child: _buildOrdersPrparing()),
              SizedBox(height: 10),
              _buildOrderTime(context),
              SizedBox(height: 10),
              Divider(
                thickness: 1,
              ),
              _buildStores(),
              Divider(thickness: 1),
              StoreOwnerWidget(),
              _buildProducts(),
              Divider(thickness: 1),
              _buildAvailableDrivers(),
              DefaultButton(
                onPressed: () {},
                text: 'Ready for recieving',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersPrparing() {
    return Card(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ordrs.length,
          itemBuilder: (_, index) => InkWell(
              onTap: () {
                setState(() {
                  orderIndex = index;
                  storeIndex = 0;
                  driverIndex = 0;
                  for (var i in List.generate(ordrs.length, (index) => index))
                    ordrs[i].isSelected = false;
                  ordrs[index].isSelected = true;
                });
              },
              child: _buildOrderLabel(ordrs[index]))),
    );
  }

  Widget _buildOrderLabel(OrderPreparing order) {
    final style =
        getRegularStyle(color: order.isPrepared ? Colors.green : Colors.red);
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 0,
      color: order.isSelected ? selectedItemColor : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(order.id, style: style),
            Expanded(
              child: Image.asset(
                order.imagePath,
                color: order.isPrepared ? Colors.green : Colors.red,
              ),
            ),
            Text(order.status, style: style)
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTime(context) {
    final sendingStyle = getRegularStyle(
        color: Theme.of(context).colorScheme.primary, fontSize: 14);
    final recieivingStyle = getRegularStyle(color: Colors.green, fontSize: 14);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(text: 'Sending time 12:30 AM', style: sendingStyle),
          TextSpan(text: '15/9/2021', style: sendingStyle),
        ])),
        SizedBox(width: 10),
        RichText(
            text: TextSpan(children: [
          TextSpan(text: 'Recieving time 02:30AM', style: recieivingStyle),
          TextSpan(text: '15/9/2021', style: recieivingStyle),
        ]))
      ],
    );
  }

  Widget _buildStores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                style: getRegularStyle(fontSize: 18),
                text: 'Stores ',
                children: [TextSpan(text: '1/1')])),
        SizedBox(height: 15),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stores.length,
              itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    setState(() {
                      storeIndex = index;
                      for (var i
                          in List.generate(stores.length, (index) => index))
                        stores[i].isSelected = false;
                      stores[index].isSelected = true;
                    });
                  },
                  child: _buildStore(stores[index]))),
        ),
      ],
    );
  }

  Widget _buildStore(StoreData store) {
    return Builder(builder: (context) {
      return CardWidget(
          width: MediaQuery.of(context).size.width * 0.23,
          imagePath: store.imagePath,
          title: store.name,
          bottom: Text('${store.finished}/${store.total}',
              style: getRegularStyle(
                  color:
                      store.isFinishedPreparing ? Colors.green : Colors.red)),
          isSelected: store.isSelected);
    });
  }

  Widget _buildProducts() {
    List<Widget> list = [
      _buildProductItem('asset/images/product.png', 'حذاء رياضي', true),
      _buildProductItem('asset/images/product.png', 'حذاء رياضي', false),
    ];
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    style: getRegularStyle(fontSize: 18, color: Colors.black),
                    text: 'Products ',
                    children: [
                  TextSpan(
                      text: '1/2',
                      style: getRegularStyle(
                          color: Theme.of(context).primaryColor))
                ])),
            const SizedBox(height: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.21,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (_, int) => list[int]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(
      String imagePath, String productName, bool isSelected) {
    return Builder(builder: (context) {
      return CardWidget(
          width: MediaQuery.of(context).size.width * 0.29,
          imagePath: imagePath,
          title: productName,
          bottom: Text(isSelected ? 'Ready' : 'processing',
              style: getRegularStyle(
                  fontSize: 15,
                  color: isSelected ? Colors.green : Colors.red)));
    });
  }

  Widget _buildAvailableDrivers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available drivers ',
          style: getRegularStyle(fontSize: 18, color: Colors.black),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.21,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: drivers.length,
              itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    To(context, DriverProfileManagement());
                    setState(() {
                      driverIndex = index;
                      for (var i in List.generate(drivers.length, (ij) => ij))
                        drivers[i].isSelected = false;
                      drivers[index].isSelected = true;
                    });
                  },
                  child: _buildAvailableDriverPerson(drivers[index]))),
        ),
      ],
    );
  }

  Widget _buildAvailableDriverPerson(DriverData driver) {
    return Builder(builder: (context) {
      return CardWidget(
          width: MediaQuery.of(context).size.width * 0.29,
          imagePath: driver.imagePath,
          title: driver.name,
          bottom: Column(
            children: [
              Text('${driver.distance} KM / ${driver.time} m',
                  style: getRegularStyle(
                    fontSize: 14,
                  )),
              RichText(
                text: TextSpan(
                  text: '${driver.points.toString()} ',
                  style: getRegularStyle(
                      color: Theme.of(context).colorScheme.primary),
                  children: [
                    TextSpan(text: 'Points', style: getRegularStyle())
                  ],
                ),
              ),
            ],
          ),
          isSelected: driver.isSelected);
    });
  }
}

class OrderPreparing {
  bool isSelected;
  String imagePath;
  String id;
  String status;
  bool isPrepared;
  OrderPreparing(
      this.id, this.imagePath, this.status, this.isSelected, this.isPrepared);
}

class StoreData {
  bool isSelected;
  bool isFinishedPreparing;
  String imagePath;
  String name;
  int finished;
  int total;
  StoreData(this.imagePath, this.name, this.finished, this.total,
      this.isSelected, this.isFinishedPreparing);
}

class DriverData {
  String name;
  int distance;
  int time;
  int points;
  String imagePath;
  bool isSelected;
  DriverData(this.imagePath, this.name, this.distance, this.time, this.points,
      this.isSelected);
}
