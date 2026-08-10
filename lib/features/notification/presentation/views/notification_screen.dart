import 'package:awraq/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:awraq/features/notification/presentation/cubit/notification_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_texts/notification_texts.dart';
import '../widgets/empty_notification.dart';
import '../widgets/notification_card.dart';
import '../widgets/notification_dialog.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 60.h,
        centerTitle: true,

        leadingWidth: 64.w,

        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Align(
            alignment: Alignment.center,
            child: Material(
              color: const Color(0xffF6F7FB),
              borderRadius: BorderRadius.circular(12.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 16.sp,
                      color: const Color(0xff1F2937),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        title: Text(
          NotificationTexts.notification,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xff1F2937),
          ),
        ),
      ),

      body: BlocBuilder<NotificationCubit, NotificationStates>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NotificationFailure) {
            return Center(
              child: Text(
                state.error,
                textAlign: TextAlign.center,
              ),
            );
          }

          final cubit = context.read<NotificationCubit>();

          if (!cubit.hasNotifications) {
            return const EmptyNotification();
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // هنضيف mark all as read بعدين
                    },
                    child: Text(
                      NotificationTexts.makeAllRead,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff4A90FF),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 20.h),
                    itemCount: cubit.notifications.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: 14.h),
                    itemBuilder: (context, index) {
                      final notification =
                          cubit.notifications[index];

                      return NotificationCard(
                        notification: notification,
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor:
                                Colors.black.withOpacity(.35),
                            builder: (_) {
                              return NotificationDialog(
                                notification: notification,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}