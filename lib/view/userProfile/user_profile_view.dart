// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_shop/model/models.dart';
import 'package:sneakers_shop/utils/constants.dart';

import '../../data/dummy_data.dart';
import '../../theme/custom_app_theme.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_list_tile.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  int statusIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBarProfile(),
        body: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  userInfo(width),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    width: width,
                    height: height * 0.13,
                    child: ZoomIn(
                      delay: Duration(milliseconds: 400),
                      curve: Curves.decelerate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "My Status ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Container(
                            width: width,
                            height: height * 0.08,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: userStatus.length,
                              itemBuilder: ((context, index) {
                                UserStatus status = userStatus[index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      statusIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: statusIndex == index
                                          ? status.selectColor
                                          : status.unSelectColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          status.emoji,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          status.txt,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppConstantsColor
                                                  .lightTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  dashboaedSection(height, width),
                  bottomSection(width, height),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bottomSection(width, height) {
    return FadeInDown(
      delay: Duration(milliseconds: 400),
      curve: Curves.decelerate,
      child: Container(
        width: width,
        height: height / 6.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "    My Account",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "    Switch to Other Account",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[600],
                  fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "    Log Out",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red[500],
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboaedSection(double height, double width) {
    return FadeInDown(
      delay: Duration(milliseconds: 400),
      curve: Curves.decelerate,
      child: SizedBox(
        width: width,
        height: height / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Dashboard",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            CustomListTile(
              height: height,
              width: width,
              icon: Icons.wallet_travel_outlined,
              leadingBackColor: Colors.green,
              title: "Payment",
              trailing: Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "2New ",
                      style: TextStyle(
                          color: AppConstantsColor.lightTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: AppConstantsColor.lightTextColor,
                    )
                  ],
                ),
              ),
            ),
            CustomListTile(
              height: height,
              width: width,
              icon: Icons.archive,
              leadingBackColor: Colors.yellow,
              title: "Achievements",
              trailing: Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            CustomListTile(
              height: height,
              width: width,
              icon: Icons.shield,
              leadingBackColor: Colors.grey,
              title: "Privacy",
              trailing: Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userInfo(double width) {
    return FadeInDown(
      delay: Duration(milliseconds: 400),
      curve: Curves.decelerate,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 45,
            child: Text(
              "D",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
          SizedBox(width: width * 0.03),
          Column(
            children: [
              Text(
                "Daniel Adrah",
                style: AppThemes.profileDevName,
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
          SizedBox(
            width: width * 0.03,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
