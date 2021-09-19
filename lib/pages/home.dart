import 'package:awquiz/pages/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home/quiz_category_card.dart';
import 'home/quiz_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List quizImages = ["5", "6", "7", "8", "9"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ]),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  QuizSearchView(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (_, index) => QuizCategoryCard(
                        image: quizImages[index % (quizImages.length)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //         Navigator.of(context).pushReplacement(
      //           PageRouteBuilder(
      //             pageBuilder: (context, animation, secondaryAnimation) =>
      //                 OnboardingPage(),
      //             transitionsBuilder:
      //                 (context, animation, secondaryAnimation, child) =>
      //                     FadeTransition(
      //               opacity: animation,
      //               child: child,
      //             ),
      //           ),
      //         );
      //       },
      //     )
      //   ],
      // ),
    );
  }
}
