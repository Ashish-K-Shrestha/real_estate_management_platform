// import 'package:flutter/material.dart';
// import 'package:real_estate_management_platform/src/constants/sizes.dart';
// import 'package:real_estate_management_platform/src/constants/text_strings.dart';

// class SignupFormWidget extends StatelessWidget {
//   const SignupFormWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         child: Container(
//             padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: tFormHeight - 20),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     label: Text(tFullName),
//                     prefixIcon: Icon(Icons.person_outline_rounded),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: tFormHeight - 20),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     label: Text(tEmail),
//                     prefixIcon: Icon(Icons.email_outlined),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: tFormHeight - 20),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     label: Text(tPhoneNo),
//                     prefixIcon: Icon(Icons.numbers),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: tFormHeight - 20),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     label: Text(tPassword),
//                     prefixIcon: Icon(Icons.fingerprint),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: tFormHeight),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: () {}, child: Text(tSignup.toUpperCase())),
//                 )
//               ],
//             )));
//   }
// }
