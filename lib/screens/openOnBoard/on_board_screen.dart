import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/screens/login/login_screen.dart';
import 'package:clean_app/widgets/indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );
  final List<Widget> _onBoardPages = [
    _OnBoardPage(
        title: 'Shopping become easier',
        discription: 'Welcome you in Mark8 for electronic shopping',
        imagePath: 'asset/images/onBoard1.png'),
    _OnBoardPage(
        title: 'Choose your favorite stores',
        discription:
            'We hope to be better in shopping over internet in Jordan and the world',
        imagePath: 'asset/images/onBoard2.png'),
    _OnBoardPage(
        title: 'Delivery company in your hands',
        discription: 'Recieve orders in store or from your home',
        imagePath: 'asset/images/onBoard3.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            child: PageView(
              controller: _pageController,
              children: _onBoardPages,
              onPageChanged: (value) => {setCurrentPage(value)},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: DefaultButton(
                      text: 'Skip',
                      onPressed: () {
                        // changePage();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                      logoPath: 'asset/images/login_logo.png',
                                    )));
                      }
                      //fetchApiLogin
                      ),
                ),
                Expanded(
                  child: Center(
                      child: IndicatorWidget(
                    pageController: _pageController,
                    count: _onBoardPages.length,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: 10,
        width: (currentPage == pageNo) ? 20 : 10,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (currentPage == pageNo) ? Color(0xff005BAA) : Colors.grey));
  }

  Column onBoardPage(String img, {String? title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.4,
            // width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/images/$img.png'))),
          ),
        ),
      ],
    );
  }

  void changePage() {
    print(currentPage);
    if (currentPage == 2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                    logoPath: 'asset/images/login_logo.png',
                  )));
    } else {
      _pageController.animateToPage(currentPage + 1,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
  }
}

class _OnBoardPage extends StatelessWidget {
  final String title;
  final String discription;
  final String imagePath;
  _OnBoardPage(
      {required this.title,
      required this.discription,
      required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.4,
              // width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imagePath))),
            ),
          ),
          onBoardText(title, discription)
        ],
      ),
    );
  }
}
