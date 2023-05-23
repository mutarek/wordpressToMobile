import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_mobile/data/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Wordpress App"),
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: homeProvider.postModelList.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(homeProvider.postModelList[index].title!.rendered.toString()),
              );
            },
          ),
        ),
      );
    });
  }
}
