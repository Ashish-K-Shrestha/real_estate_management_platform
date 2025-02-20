// import 'package:flutter/material.dart';
// import 'package:real_estate_management_platform/src/constants/colors.dart';
// import 'package:real_estate_management_platform/src/constants/image_strings.dart';
// import 'package:real_estate_management_platform/src/constants/sizes.dart';
// import 'package:real_estate_management_platform/src/constants/text_strings.dart';

// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.menu, color: Colors.black),
//         title: Text(tAppName, style: Theme.of(context).textTheme.headlineSmall),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 20, top: 7),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10), color: tcardBgColor),
//             child: IconButton(
//                 onPressed: () {},
//                 icon: const Image(image: AssetImage(tUserImage))),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//           child: Container(
//         padding: const EdgeInsets.all(tDashboardPadding),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(tDashboardTitle, style: Theme.of(context).textTheme.bodySmall),
//             Text(tDashboardHeading,
//                 style: Theme.of(context).textTheme.headlineMedium),
//             const SizedBox(height: tDashboardCardPadding),
//             //Search bar
//             Container(
//               decoration: const BoxDecoration(
//                   border: Border(left: BorderSide(width: 4))),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(tDashboardSearch,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineSmall
//                           ?.apply(color: Colors.grey.withOpacity(1))),
//                   const Icon(Icons.mic, size: 25),
//                 ],
//               ),
//             ),

//             const SizedBox(height: tDashboardCardPadding),
//             //Categories
//             SizedBox(
//               width: 170,
//               height: 50,
//               child: Row(
//                 children: [
//                   Container(
//                     width: 45,
//                     height: 45,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: tDarkcolor),
//                     child: Center(
//                       child: Text(
//                         "RE",
//                         style: Theme.of(context)
//                             .textTheme
//                             .headlineMedium
//                             ?.apply(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 5),
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [Text("Real Estate"), Text("10 Estates")],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
