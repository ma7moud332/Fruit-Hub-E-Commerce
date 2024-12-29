import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} , and code is ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد تم استخدام هذا البريد الإلكتروني بالفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالإنترنت ، يرجى التحقق من اتصالك.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الإلكتروني غير صالح.');
      } else {
        throw CustomException(
            message: ' لقد حدث خطاء ما ، يرجى المحاولة في وقت لاحق.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');

      throw CustomException(
          message: ' لقد حدث خطاء ما ، يرجى المحاولة في وقت لاحق.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'كلمة المرور او البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'كلمة المرور او البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالإنترنت ، يرجى التحقق من اتصالك.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الإلكتروني غير صالح.');
      } else {
        throw CustomException(
            message: ' لقد حدث خطاء ما ، يرجى المحاولة في وقت لاحق.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
          message: ' لقد حدث خطاء ما ، يرجى المحاولة في وقت لاحق.');
    }
  }
}
