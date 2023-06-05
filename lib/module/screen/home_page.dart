import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_mobile/data/provider/home_provider.dart';
import 'package:wordpress_mobile/module/screen/article_page.dart';
import 'package:wordpress_mobile/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Provider.of<HomeProvider>(context, listen: false).getAllPosts();
    Provider.of<HomeProvider>(context, listen: false).getAllCategories();
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        backgroundColor: kHomeBgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 32.0, bottom: 0, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: kHomeBgColor,
                        backgroundImage: NetworkImage(
                          "https://cimages1.touristlink.com/data/cache/member/218021/tarek_edit_5701_200_0.jpg",
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                          child: Text(
                        "Hey User",
                        style: TextStyle(fontSize: 15.0, color: kLightColor),
                      )),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: kHomeBgColor,
                        backgroundImage: NetworkImage(
                          "https://cimages1.touristlink.com/data/cache/member/218021/tarek_edit_5701_200_0.jpg",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "Trending", style: TextStyle(fontSize: 26, color: kLightColor)),
                    TextSpan(text: " "),
                    TextSpan(text: "Blogs", style: TextStyle(fontSize: 26, color: kLightColor, fontWeight: FontWeight.bold)),
                  ])),
                  SizedBox(height: 22.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          homeProvider.blogTypes.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  homeProvider.updateCurrentIndex(index);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 24.0),
                                  child: Column(
                                    children: [
                                      Chip(
                                        backgroundColor: homeProvider.selectedIndex == index ? Colors.green : kHomeBgColor,
                                        label: Text(
                                          homeProvider.blogTypes[index],
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: homeProvider.selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                                              color: homeProvider.selectedIndex == index ? kLightColor : kLightColor.withOpacity(0.04)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8.0),
                                        height: 4.0,
                                        width: 4.0,
                                        color: homeProvider.selectedIndex == index ? kLightColor : kHomeBgColor,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  homeProvider.isLoading?
                      const SizedBox(
                        height: 250,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ):Stack(
                    children: [
                      Container(
                        height: 250,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(image: AssetImage("assets/icons/rajshahi.jpg"), fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How to Work on Your Dream",
                                style: TextStyle(fontSize: 20, color: kLightColor, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    child: Image.asset(
                                      "assets/icons/homeIcon.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        "M Tarek",
                                        style: TextStyle(fontSize: 15, color: kLightColor),
                                      )),
                                  Text("10 May 2023", style: TextStyle(fontSize: 15, color: kLightColor)),
                                  SizedBox(
                                    height: 24.0,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 15, color: kLightColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  homeProvider.isLoading
                      ? SizedBox(
                          height: 162,
                          width: double.infinity,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container(
                          height: 162.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.categoryList.length,
                            itemBuilder: (_, index) {
                              var data = homeProvider.categoryList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => ArticlePage()));
                                },
                                child: Container(
                                  height: 162,
                                  width: 152.0,
                                  margin: EdgeInsets.only(right: 22.0),
                                  decoration: BoxDecoration(color: kCatColor.withOpacity(0.04), borderRadius: BorderRadius.circular(18.0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 16, bottom: 24),
                                        child: Image.asset(
                                          "assets/icons/branch.png",
                                          color: kLightColor,
                                          height: 32,
                                          width: 32,
                                        ),
                                      ),
                                      Text(data.name.toString(),
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kLightColor)),
                                      SizedBox(height: 8),
                                      Text("${data.count} Articles",
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kLightColor.withOpacity(0.5)))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
