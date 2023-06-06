import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsScreen extends StatefulWidget {
  final String content;
  final String image;

  const DetailsScreen(this.content, this.image, {Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Widget postContent(htmlContent) {
    return Html(
      data: htmlContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      height: 200,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: widget.image,
                        fit: BoxFit.fitWidth,
                      )
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_circle_left,color: Colors.white,
                          size: 35,
                        ))
                  )
                ],
              ),
              postContent(widget.content)
            ],
          ),
        ),
      ),
    );
  }
}
