import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:clean_app/general_commponent/components.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/profiles/personal/edit_personal_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_widgets/cancel_Item.dart';

class SettinsgScreen extends StatefulWidget {
  const SettinsgScreen({Key? key}) : super(key: key);

  @override
  State<SettinsgScreen> createState() => _SettinsgScreenState();
}

class _SettinsgScreenState extends State<SettinsgScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: getRegularStyle(fontSize: 22, color: ColorManager.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _buildSettingItem(
                        'asset/images/person.png', 'Account settings',
                        onPressed: () {
                      To(context, EditPersonalProfile());
                    }),
                    _buildSettingItem(
                        'asset/images/translate.png', 'Change language',
                        onPressed: _onChangeLangPressed),
                    _buildSettingItem(
                        'asset/images/notification.png', 'Notification',
                        onPressed: null,
                        trailing: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.18,
                            child: CustomFlutterSwitch())),
                    _buildSettingItem(
                        'asset/images/files.png', 'Terms and conditions',
                        onPressed: () {}),
                    _buildSettingItem('asset/images/info.png', 'Who we are',
                        onPressed: () {}),
                    _buildSettingItem('asset/images/phone.png', 'Call us',
                        onPressed: () {}),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultButton(
                    onPressed: () {},
                    text: 'Sign out',
                    radius: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildNotificationIcon() {
    return Column(
      children: [
        Image.asset(
          'asset/images/notification.png',
          scale: 1.7,
        ),
        SizedBox(height: 5),
        Text(
          'Notifications',
          style: getRegularStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildSettingItem(String imagePath, String title,
      {required VoidCallback? onPressed, Widget? trailing}) {
    return ListTileTheme(
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: 0,
      // dense: true,
      child: Column(
        children: [
          ListTile(
            title: Text(title, style: getRegularStyle(fontSize: 18)),
            onTap: onPressed,
            leading: buildIcon(imagePath, size: 23.w),
            contentPadding: const EdgeInsets.all(0),
            trailing: trailing,
          ),
          divider(color: ColorManager.lightGrey),
        ],
      ),
    );
  }

  Widget _buildRecienveNotification(context) {
    return Row(
      children: [
        Text(
          'Recieve notifications',
          style: getRegularStyle(fontSize: 18),
        ),
        Spacer(),
        CustomFlutterSwitch()
      ],
    );
  }

  Future<void> _onChangeLangPressed() async {
    await showDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Dialog(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Choose language',
                          style: getRegularStyle(fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        DefaultButton(
                          onPressed: () {},
                          text: 'لغة عربية',
                        ),
                        SizedBox(height: 15),
                        DefaultButton(
                          onPressed: () {},
                          text: 'English UK',
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: CancelItem(),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CustomFlutterSwitch extends StatefulWidget {
  const CustomFlutterSwitch({Key? key}) : super(key: key);

  @override
  CustomFlutterSwitchState createState() => CustomFlutterSwitchState();
}

class CustomFlutterSwitchState extends State<CustomFlutterSwitch> {
  bool recieveNotifications = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        padding: 2,
        height: 27,
        value: recieveNotifications,
        toggleSize: 20,
        inactiveToggleColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.white,
        switchBorder: Border.all(color: Colors.grey.withOpacity(0.4)),
        activeColor: Theme.of(context).primaryColor,
        onToggle: (val) {
          setState(() {
            recieveNotifications = val;
          });
        });
  }
}
