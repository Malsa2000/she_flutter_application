import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.5, initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        Row(
          children: [
            Text("product"),
            Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bot');
                },
                child: Text("see All"))
          ],
        ),
        ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 150),
            child: PageView.builder(
                itemCount: 5,
                controller: _pageController,
                onPageChanged: (int currentPage) {
                  setState(() => _currentPage = currentPage);
                },
                itemBuilder: (context, index) {
                  return Container(
                    color:
                        index % 2 == 0 ? Colors.lightBlueAccent : Colors.grey,
                    child: Text("Container number $index "),
                  );
                })),
        Row(children: [
          TabPageSelectorIndicator(backgroundColor:_currentPage==0 ? Colors.red: Colors.black45, borderColor:  Colors.black45, size: 10),
          TabPageSelectorIndicator(backgroundColor:_currentPage==1 ? Colors.red: Colors.black45, borderColor:  Colors.black45, size: 10),
          TabPageSelectorIndicator(backgroundColor:_currentPage==2 ? Colors.red: Colors.black45, borderColor:  Colors.black45, size: 10),
          TabPageSelectorIndicator(backgroundColor: _currentPage==2 ? Colors.red: Colors.black45, borderColor:  Colors.black45, size: 10)

        ],),
        Row(
          children: [
            Text("افراح"),
            Spacer(),
            TextButton(onPressed: () {}, child: Text("see All"))
          ],
        ),
        ListView.builder(itemCount: 5,
            scrollDirection: Axis.horizontal,
            cacheExtent: 100/150,
             padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
            itemBuilder: (context ,index){
          return Column(
           children: [
             Image(image: AssetImage("page_view1.png")),
             Text("توليب" , style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.black),)
           ],
          );
        }),
        Row(
          children: [
            Text("هدايا"),
            Spacer(),
            TextButton(onPressed: () {}, child: Text("see All"))
          ],
        ),

        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200, maxWidth: 300),
          child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.indigo,
                  child: Text("$index" ,style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white),),
                  alignment: AlignmentDirectional.center,
                );
              }),
        ),
        Row(
          children: [
            Text("تخرج"),
            Spacer(),
            TextButton(onPressed: () {}, child: Text("see All"))
          ],
        ),
        GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                childAspectRatio: 50 / 80,
                mainAxisSpacing: 10),
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  "توليب  $index",
                  style: GoogleFonts.cairo(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                height: 250.h,
                width: 150.w,
                decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 2),
                          color: Colors.black45)
                    ]),
              );
            }),
      ],
    );
  }
}
