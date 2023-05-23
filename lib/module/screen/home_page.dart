import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_mobile/data/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).getAllPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Wordpress App"),
      ),
      body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return homeProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: homeProvider.postModelList.length,
                itemBuilder: (_, index) {
                  var model = homeProvider.postModelList[index];
                  return SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)
                            ),
                          ),
                          child: Image.network(
                            model.yoast_head_json!.ogImage[0].url,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Text(model.title!.rendered.toString()),
                        )
                      ],
                    ),
                  );
                },
              );
      }),
    );
  }
}
