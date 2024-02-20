import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../widgets/appbar_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(
          leadingIcon: 'assets/icons/Expand_left.png',
          leadingOnTap: () {
            Get.back();
          },
          richTextSpan: const TextSpan(
            text: 'Notifications',
            style: AppTextStyles.appbarTextStyle2,
            children: <TextSpan>[],
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              DismissDirection.startToEnd;
              setState(() {
                items.removeAt(index);
              });

              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
            // Show a red background as the item is swiped away.
            background: Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
              margin: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: AppColors.gradientOne,
              ),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Image.asset("assets/icons/Subtract.png"),
              ),
            ),

            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              margin: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Image.asset(
                      "assets/icons/Bell_pin.png",
                      height: 28.h,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 6, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Event Notifications title will go here",
                            textAlign: TextAlign.start,
                            style: AppTextStyles.bodyTextStyle2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                            textAlign: TextAlign.start,
                            style: AppTextStyles.bodyTextStyle3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
