import 'package:awraq/core/services/firebase_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_validations.dart';
import '../../../../core/utils/auth_error_mapper.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_status.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repository) : super(const LoginState());

  final AuthRepository repository;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool get isValid =>
      AppValidator.email(emailController.text) == null &&
      passwordController.text.trim().isNotEmpty;

  // ============================================================
  // EMAIL CHANGED
  // ============================================================

  void emailChanged(String _) {
    emit(
      state.copyWith(
        revision: state.revision + 1,
      ),
    );
  }

  // ============================================================
  // PASSWORD CHANGED
  // ============================================================

  void passwordChanged(String _) {
    emit(
      state.copyWith(
        revision: state.revision + 1,
        passwordErrorText: null,
      ),
    );
  }

  // ============================================================
  // TOGGLE PASSWORD
  // ============================================================

  void togglePassword() {
    emit(
      state.copyWith(
        revision: state.revision + 1,
        obscurePassword: !state.obscurePassword,
      ),
    );
  }

  // ============================================================
  // LOGIN
  // ============================================================

  Future<void> login() async {
    final isFormValid =
        formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      if (isClosed) return;

      emit(
        state.copyWith(
          status: AuthStatus.validationError,
        ),
      );

      return;
    }

    if (isClosed) return;

    emit(
      const LoginState(
        status: AuthStatus.loading,
      ),
    );

    try {
      // ========================================================
      // 1. LOGIN
      // ========================================================

      final response = await repository.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (isClosed) return;

      print('================================');
      print('✅ LOGIN SUCCESS');
      print('================================');

      // ========================================================
      // 2. CHECK ACCESS TOKEN
      // ========================================================

      final accessToken = response.accessToken;

      if (accessToken == null || accessToken.isEmpty) {
        emit(
          const LoginState(
            status: AuthStatus.failure,
            message:
                'Login succeeded, but no access token was returned.',
          ),
        );

        return;
      }

      print('🔑 ACCESS TOKEN EXISTS');

      // ========================================================
      // 3. GET FCM TOKEN
      // ========================================================

      final fcmToken =
          await FirebaseNotificationService
              .instance
              .getFcmToken();

      print('================================');
      print('🔥 FCM TOKEN BEFORE SEND');
      print('$fcmToken');
      print('================================');

      // ========================================================
      // 4. SEND FCM TOKEN TO BACKEND
      // ========================================================

      if (fcmToken != null && fcmToken.isNotEmpty) {
        try {
          await repository.registerFcmToken(
            fcmToken,
          );

          print('================================');
          print('✅ FCM TOKEN SENT TO BACKEND');
          print('================================');
        } catch (e) {
          // FCM failed, but LOGIN succeeded.
          print('================================');
          print('❌ FCM TOKEN FAILED TO SEND');
          print('❌ ERROR => $e');
          print('================================');
        }
      } else {
        print('❌ FCM TOKEN IS NULL OR EMPTY');
      }

      if (isClosed) return;

      // ========================================================
      // 5. LOGIN SUCCESS
      // ========================================================

      emit(
        const LoginState(
          status: AuthStatus.success,
        ),
      );
    } catch (error) {
      if (isClosed) return;

      print('================================');
      print('❌ LOGIN FAILED');
      print('❌ ERROR => $error');
      print('================================');

      emit(
        LoginState(
          status: AuthStatus.failure,
          passwordErrorText:
              'This password is incorrect.',
          message: AuthErrorMapper.message(error),
        ),
      );
    }
  }

  // ============================================================
  // CLOSE
  // ============================================================

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}