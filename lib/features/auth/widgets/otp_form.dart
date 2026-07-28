import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../controller/otp_controller.dart';
import 'login_button.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<OtpController>();

    return Column(
      children: [

        Pinput(
          controller: controller.pinController,
          length: 6,
          onChanged: (_) => controller.onChanged(),
        ),

        if (controller.wrongOtp)

          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "This is incorrect OTP",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
          ),

        const SizedBox(height: 25),

        LoginButton(
  title: "Verify",
  enabled: controller.enableButton,
  onPressed: () {
    controller.verifyOtp(context);
  },
),

        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Didn't receive the code ? ",
            ),

            GestureDetector(
              onTap: () {},
              child: const Text(
                "Resend",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}