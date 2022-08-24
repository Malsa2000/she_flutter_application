import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritList extends StatefulWidget {
  const FavoritList({Key? key}) : super(key: key);

  @override
  State<FavoritList> createState() => _FavoritListState();
}

class _FavoritListState extends State<FavoritList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("favorit"),
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/page_view1.png"),
                maxRadius: 100.r,
              ),
              Text(
                  textAlign: TextAlign.center,
                  "Malse Applcation",
                  style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              Text("info Applcation",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
              SizedBox(
                height: 20.h,
              ),
              TabBar(
                onTap: (int index) {
                  setState(() => _tabController.index = index);
                },
                indicator: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Colors.black45,
                          offset: Offset(0, 3))
                    ]),
                labelColor: Colors.black,
                controller: _tabController,
                tabs:  [Text("Screen 1",style: GoogleFonts.aclonica(fontSize: 20 ,fontWeight: FontWeight.bold),),
                  Text("Screen 2",style: GoogleFonts.aclonica(fontSize: 20 ,fontWeight: FontWeight.bold),),],
              ),
              Expanded(
                child: IndexedStack(
                  index: _tabController.index,
                  children: [
                    Visibility(
                      visible: _tabController.index == 0,
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("$index"),
                            );
                          }),
                    ),
                    Visibility(
                      visible: _tabController.index == 1,
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 50 / 80,
                                  mainAxisSpacing: 10),
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                "elemnt $index",
                                style: GoogleFonts.cairo(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange),
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
                      //   child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
                      //       itemCount: 10,
                      //       physics: NeverScrollableScrollPhysics(),
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.vertical,
                      //       itemBuilder: (context, index) {
                      //         return ListTile(
                      //           title: Text("$index"),
                      //         );
                      //       }),
                    ),
                  ],
                ),
              )
            ]));
  }
}
