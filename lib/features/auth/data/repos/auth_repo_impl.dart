import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/backend_endboints.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/services/firebase_auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImpl(
      {required this.dataBaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        uId: user.uid,
        name: name,
        email: email,
      );
      await addUserData(user: userEntity);
      return Right(
        userEntity,
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure('لقد حدث خطأ ما ، يرجى المحاولة في وقت لاحق'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      var userEntity = await getUserData(uid: user.uid);
      await  saveUserData(user: userEntity);
      return Right(
        userEntity,
      );
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure('لقد حدث خطأ ما ، يرجى المحاولة في وقت لاحق'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);

      var isUserExist = await dataBaseService.checkIfDataExists(
        path: BackendEndboints.isUserExist,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return Right(
        userEntity,
      );
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}',
      );
      return left(
        ServerFailure('لقد حدث خطاء ما ، يرجى المحاولة في وقت لاحق'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);

      await addUserData(user: userEntity);
      return Right(
        userEntity,
      );
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signinWithFacebook: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseService.addData(
      path: BackendEndboints.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseService.getData(
        path: BackendEndboints.getUserData, documentId: uid);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());

    await Prefs.setString(kUserData, jsonData);
  }
}
