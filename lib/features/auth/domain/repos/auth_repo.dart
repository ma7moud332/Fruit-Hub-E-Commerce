import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user});

  Future saveUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uid});

}
