import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_mobile/data/provider/home_provider.dart';
import 'package:wordpress_mobile/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<String> blogTypes = ["All", "Sajek", "Cox's Bazar", "Rangamati"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Provider.of<HomeProvider>(context, listen: false).getAllPosts();
    return Scaffold(
      backgroundColor: kHomeBgColor,
      body: Container(
        padding: EdgeInsets.only(top: 64.0, bottom: 0, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsvsnqMrXyexc6ybwiQUm5M5T06Z7idAb1EA&usqp=CAU",
                  height: 52.0,
                  width: 52.0,
                )),
                SizedBox(
                  width: 18,
                ),
                Expanded(
                    child: Text(
                  "Hey Valley",
                  style: TextStyle(fontSize: 15.0, color: kLightColor),
                )),
                CircleAvatar(
                    child: Image.asset(
                  "assets/icons/profileIcon.jpg",
                  height: 52.0,
                  width: 52.0,
                )),
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
                    blogTypes.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Column(
                              children: [
                                Chip(
                                  backgroundColor: selectedIndex == index ? Colors.green : kHomeBgColor,
                                  label: Text(
                                    blogTypes[index],
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                                        color: selectedIndex == index ? kLightColor : kLightColor.withOpacity(0.04)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8.0),
                                  height: 4.0,
                                  width: 4.0,
                                  color: selectedIndex == index ? kLightColor : kHomeBgColor,
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
            Stack(
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
                    padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 20.0),
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
                            Image.asset(
                              "assets/icons/homeIcon.png",
                              height: 40,
                              width: 40,
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
                            SizedBox(height: 24.0,)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
