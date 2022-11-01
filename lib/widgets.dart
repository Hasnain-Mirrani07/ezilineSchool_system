import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Student_Data/constants.dart';

class imagesWidget extends StatelessWidget {
  const imagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: defaultPadding * 2),
          Row(
            children: [
              Spacer(),
              Expanded(
                flex: 8,
                child: SvgPicture.asset(
                  "assets/icons/chat.svg",
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: defaultPadding * 2),
        ],
      ),
    );
  }
}
