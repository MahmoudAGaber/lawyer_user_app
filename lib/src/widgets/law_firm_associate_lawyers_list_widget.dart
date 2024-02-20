// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:resize/resize.dart';
// import '../api_services/urls.dart';
// import '../config/app_colors.dart';
// import '../config/app_text_styles.dart';
// import '../controllers/all_events_controller.dart';
// import '../controllers/general_controller.dart';
// import '../routes.dart';
// import 'custom_skeleton_loader.dart';

// class LawFirmAssociateLawyersListWidget extends StatefulWidget {
//   final String lawyerName, categoryName;
  
//   final VoidCallback profileOnTap;
//   const LawFirmAssociateLawyersListWidget({
//     Key? key,
//     required this.lawyerName,
//     required this.lawyerImage,
//     required this.categoryName, required this.profileOnTap,
//   }) : super(key: key);

//   @override
//   _LawFirmAssociateLawyersListWidgetState createState() =>
//       _LawFirmAssociateLawyersListWidgetState();
// }

// class _LawFirmAssociateLawyersListWidgetState
//     extends State<LawFirmAssociateLawyersListWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<GeneralController>(builder: (generalController) {
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AspectRatio(
//             aspectRatio: 3 / 1.69,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               shrinkWrap: true,
//               itemCount: 1,
//               padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: widget.profileOnTap,
//                   // () {
//                   //   generalController.updateSelectedEventForView(
//                   //       allEventsController
//                   //           .getAllEventsModel.data!.data![index]);
//                   //   Get.toNamed(PageRoutes.eventDetailScreen);
//                   // },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(18),
//                         child: widget.lawyerImage
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         // allEventsController
//                         //     .getAllEventsModel.data!.data![index].name
//                         //     .toString(),
//                         "Legal Consultation",
//                         style: AppTextStyles.bodyTextStyle2,
//                       ),
//                       const SizedBox(height: 6),
//                       const Text(
//                         "Education Law Specialist",
//                         style: AppTextStyles.bodyTextStyle3,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (context, position) {
//                 return SizedBox(width: 18);
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }
