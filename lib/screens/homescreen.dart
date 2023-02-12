import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_mind/screens/category_box_for_filter.dart';
import 'package:mentor_mind/screens/request_box.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  List<String> types = [
    'All',
    'Physics',
    'Data Structure',
    'Maths',
    'Chemisty',
    'ML'
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 3,
        title: Text(
          'Hello 👋',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            CupertinoIcons.add,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            CupertinoIcons.person_crop_circle_fill,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Help students',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Satoshi',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.types.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: CategoryBoxForFilter(
                          name: widget.types[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RequestBox(),
                  RequestBox(),
                  RequestBox(),
                  RequestBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
