import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widgets_and_onboarding/color/color_palete.dart';
import 'package:widgets_and_onboarding/style/text_style.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

PageController onBoardingContoller = PageController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: onBoardingContoller,
        // onPageChanged: (value) {
        //   print(value);
        // },
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          OnBoarding(
              title: "Write Lists",
              image: 'assets/images/cuate.png',
              des: "Aliquip eu sint \nsint ullamco commodo.",
              btnText: "Next",
              index: 0),
          OnBoarding(
              title: "Write Lists",
              image: 'assets/images/cuate2.png',
              des: "Ex qui sit in cillum officia.",
              btnText: "Next",
              index: 1),
          OnBoarding(
              title: "Write Lists",
              image: 'assets/images/cuate3.png',
              des:
                  "Nulla nisi consequat fugiat deserunt qui voluptate anim ullamco ad mollit id aliqua cillum.",
              btnText: "Let Start",
              index: 2),
          Scaffold(
            backgroundColor: primary,
          )
        ],
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding(
      {super.key,
      required this.title,
      required this.image,
      required this.des,
      required this.btnText,
      required this.index});

  final String title;
  final String image;
  final String des;
  final String btnText;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                
                Icons.skip_next,
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.hardEdge,
            width: 300,
            height: 200,
            child: Image.asset(
              image,
            ),
          ),
          Text(
            title,
            style: headlineTextStyle,
          ),
          Text(
            des,
            style: subtitleTextStyle,
          ),

          // SmoothPageIndicator(

          //     controller: onBoardingContoller, // PageController
          //     count: 4,
          //     effect: WormEffect(dotColor: secondary,activeDotColor: primary), // your preferred effect
          //     onDotClicked: (index) {}),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (index == 0) ? primary : secondary),
                width: 10,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (index == 1) ? primary : secondary),
                  width: 10,
                  height: 10,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (index == 2) ? primary : secondary),
                width: 10,
                height: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: InkWell(
              onTap: () {
                onBoardingContoller.nextPage(
                    duration: Duration(seconds: 3),
                    curve: Curves.fastEaseInToSlowEaseOut);
                // onBoardingContoller.animateToPage(3,
                //     duration: Duration(seconds: 2), curve: Curves.easeOutCirc);
              },
              child: Container(
                // ? Cover the child with specific decoration
                // foregroundDecoration: BoxDecoration(
                //   color: Colors.green,
                //   shape: BoxShape.circle,
                // ),
                alignment: Alignment.center,
                child: Text(
                  btnText,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                width: 317,
                height: 54,
                decoration: BoxDecoration(
                  // ? Example For Bad Red Shadow
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.red,
                  //     blurRadius: 0.5,
                  //     spreadRadius: 1,
                  //     blurStyle: BlurStyle.normal,
                  //     offset: Offset(-10, 10),
                  //   )
                  // ],
                  borderRadius: BorderRadius.circular(20),
                  color: primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
