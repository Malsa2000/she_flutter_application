import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBording extends StatefulWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
              visible: _currentPage < 2,
              replacement: TextButton(
                child: Text("Start"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },

              ),
              child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: Duration(seconds: 2),
                        curve: Curves.easeInCirc);
                  },
                  child: Text("skip")),
            ),
          ),
          Expanded(
              child: PageView(
            onPageChanged: (int numberPage) {
              setState(() => _currentPage = numberPage);
            },
            controller: _pageController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image(image: AssetImage("images/page_view1.png") ,height: 200,width: 300,),
                  Text(
                    "Page1",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "Text messaging, or texting, is the act of composing and "
                    "sending electronic messages, typically consisting "
                    "of alphabetic and numeric characters",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image(image: AssetImage("images/page_view3.png"),height: 200,width: 300,),
                  Text(
                    "Page3",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "Text messaging, or texting, is the act of composing and "
                    "sending electronic messages, typically consisting "
                    "of alphabetic and numeric characters",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("images/page_view2.png"),height: 200,width: 300,),
                  Text(
                    "Page2",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                        "Text messaging, or texting, is the act of composing and "
                        "sending electronic messages, typically consisting "
                        "of alphabetic and numeric characters",
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.normal, fontSize: 15),
                        textAlign: TextAlign.center

                    ),
                  ),
                ],
              )
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabPageSelectorIndicator(
                backgroundColor:
                    _currentPage == 0 ? Colors.purple : Colors.grey,
                borderColor: Colors.purple,
                size: 10,
              ),
              TabPageSelectorIndicator(
                backgroundColor:
                    _currentPage == 1 ? Colors.purple : Colors.grey,
                borderColor: Colors.purple,
                size: 10,
              ),
              TabPageSelectorIndicator(
                backgroundColor:
                    _currentPage == 2 ? Colors.purple : Colors.grey,
                borderColor: Colors.purple,
                size: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
