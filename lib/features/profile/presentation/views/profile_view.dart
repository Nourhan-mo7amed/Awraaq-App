import 'package:awraq/features/profile/presentation/widgets/logout_button.dart';
import 'package:awraq/features/profile/presentation/widgets/profile_section.dart';
import 'package:awraq/features/profile/presentation/widgets/profile_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ProfileUserCard(),
              SizedBox(height: 24),
              ProfileSection(
                title: "Account",
                isAccount: true,
              ),
              SizedBox(height: 24),
              ProfileSection(
                title: "Support",
                isAccount: false,
              ),
              SizedBox(height: 32),
              LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class ProfileRoutes extends StatelessWidget {
//   const ProfileRoutes({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios_new),
//             onPressed: () {},
//           ),
//           centerTitle: true,
//           title: Text("Profile"),
//         ),
//         body: Container(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 CircleAvatar(),
//                 SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('ooooooooooooooo'),
//                     Text('oooooooooooooo'),
//                   ],
//                 ),
//                 Icon(Icons.arrow_forward_ios)
//               ],
//             )));
//   }
// }
