import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_mobile/data/provider/home_provider.dart';
import 'package:wordpress_mobile/utils/app_colors.dart';

import '../shimmer/blog_post_shimmer.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).getAllPosts();
    double width = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.arrow_circle_left,
                          size: 45,
                          color: Colors.teal,
                        )),
                  ),
                ],
              ),
              Expanded(
                  child: homeProvider.isLoading
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.separated(
                            itemCount: 6,
                            itemBuilder: (_, index) => NewsCardSkelton(),
                            separatorBuilder: (_, index) => SizedBox(
                              height: 16,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: homeProvider.postModelList.length,
                          itemBuilder: (_, index) {
                            var data = homeProvider.postModelList[index];
                            return Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  height: 250,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(data.yoast_head_json!.ogImage[0].url), fit: BoxFit.cover)),
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
                                          data.title!.rendered.toString(),
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
                                              data.yoast_head_json!.author.toString(),
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
                            );
                          },
                        )),
            ],
          ),
        ),
      );
    });
  }
}
