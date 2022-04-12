// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:pustakalaya/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class ShowAllWidget extends StatelessWidget {
  final String leftText;
  ShowAllWidget({required this.leftText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 17,
              color: AppColors.baseBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Show All",
            style: TextStyle(
              fontSize: 17,
              color: AppColors.baseDarkPinkColor,
            ),
          )
        ],
      ),
    );
  }
}
