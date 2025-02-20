// import 'package:flutter/material.dart';
// import 'package:real_estate_management_platform/src/constants/image_strings.dart';
// import 'package:real_estate_management_platform/src/constants/text_strings.dart';
// import 'package:real_estate_management_platform/src/features/authentication/screens/login/login_form_widget.dart';
// import 'package:real_estate_management_platform/src/features/authentication/screens/login/login_header_widget.dart';

// class FormHeaderWidget extends StatelessWidget {
//   const FormHeaderWidget({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subTitle,
//   });

//   final String image, title, subTitle;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image(image: AssetImage(image), height: size.height * 0.2),
//         Text(
//           title,
//           style: Theme.of(context).textTheme.headlineLarge,
//         ),
//         Text(
//           subTitle,
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//       ],
//     );
//   }
// }
