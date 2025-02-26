// import 'package:flutter/material.dart';
// import '../../../../constants/sizes.dart';
// import '../../../../constants/text_strings.dart';
// import '../../core/screens/dashboard/dashboard.dart';

// class LoginForm extends StatelessWidget {
//   const LoginForm({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.person_outline_outlined),
//                   labelText: tEmail,
//                   hintText: tEmail,
//                   border: OutlineInputBorder()),
//             ),
//             TextFormField(
//               decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.fingerprint),
//                   labelText: tPassword,
//                   hintText: tPassword,
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     onPressed: null,
//                     icon: Icon(Icons.remove_red_eye_sharp),
//                   )),
//             ),
//             const SizedBox(height: tFormHeight - 20),
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                   onPressed: () {}, child: const Text(tForgetPassword)),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const Dashboard()),
//                       );
//                     },
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Text(tLogin.toUpperCase()),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
