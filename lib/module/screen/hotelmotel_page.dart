import 'package:flutter/material.dart';
import 'package:wordpress_mobile/utils/app_colors.dart';

class HotemotelPage extends StatefulWidget {
  const HotemotelPage({Key? key}) : super(key: key);

  @override
  State<HotemotelPage> createState() => _HotemotelPageState();
}

class _HotemotelPageState extends State<HotemotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kHomeBgColor,
        title: Text(
          "Developer Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/contactus.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            "Have an issue or query? \nFeel free to contact us",
            style: TextStyle(fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    height: 120,
                    width: 150,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.alternate_email,color: Colors.deepPurple,size: 50,),
                          Text("Write to us"),
                          Text("hello@hotelmotel.com.bd",textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    width: 150,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call,color: Colors.deepPurple,size: 50,),
                          Text("Call us"),
                          Text("+880 1957-345431",textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    width: 150,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.question_mark,color: Colors.deepPurple,size: 50,),
                          Text("Faq"),
                          Text("Frequenlty Asked Question",textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,color: Colors.deepPurple,size: 50),
                          Text("Locate to Us"),
                          Text("Find us on google maps",textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
