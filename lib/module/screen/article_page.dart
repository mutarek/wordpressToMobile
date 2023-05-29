import 'package:flutter/material.dart';
import 'package:wordpress_mobile/utils/app_colors.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (_,index){
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kHomeBgColor
              ),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://res.cloudinary.com/dhakacity/image/upload/c_scale,w_848,h_476,dpr_1.100000023841858/f_auto,q_auto/v1670167726/sajek-valley-resort.jpg?_i=AA")
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "How to Work on Your Dream",
                          style: TextStyle(fontSize: 15, color: kLightColor, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
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
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
