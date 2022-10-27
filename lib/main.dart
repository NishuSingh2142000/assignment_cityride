import 'package:assignment_demo/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'citynect',
          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400 , fontSize: 28),
        ),
        backgroundColor: Colors.white,
        actions: const [
          Icon(
            Icons.notifications_outlined,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.messenger_outline,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostWidget(
              name: 'Nishu',
              locationName: 'New Delhi',
              date: '1h and 20m ago',
              text:
                  'looking for a good animal doctor in chandel khand , anybody can suggest?',
              commentsCount: 89,
              likesCount: 20,
              imagePath: 'images/doggo.png',
              profilePath: 'images/image1.jfif',
            ),
            VerticalPostPadding(),
            PostWidget(
              name: 'Dhruv_20',
              locationName: 'Jantanagar',
              date: '10 mins ago',
              text:
                  'me and my few friends are going for food distribution to poor children tomorrow , if anybody wants to join us.Do let me know .Tomorrow at 09.30 am.We all will meet at GNK ground',
              commentsCount: 20,
              likesCount: 10,
              imagePath: null,
              profilePath: 'images/download.png',
            ),
            VerticalPostPadding(),
            PostWidget(
              name: 'Nishu',
              locationName: 'New Delhi',
              date: '1h and 20m ago',
              text:
              'looking for a good animal doctor in chandel khand , anybody can suggest?',
              commentsCount: 89,
              likesCount: 20,
              imagePath: 'images/doggo.png',
              profilePath: 'images/image1.jfif',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add_circle_outline, size: 42,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.compost, Icons.calendar_month, Icons.person_outline_sharp],
        activeIndex: 1,
        notchMargin: 0.0,
        gapLocation: GapLocation.center,
        onTap: (index) => null),
        //other params
    );
  }
}

class VerticalPostPadding extends StatelessWidget {
  const VerticalPostPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 6, width: double.infinity, color: Colors.black12,);
  }
}