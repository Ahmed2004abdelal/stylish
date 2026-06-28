import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/networks/services/firebase/auth_services.dart';
import '../../../../core/networks/services/firebase/firebase_paths.dart';
import '../../../../core/networks/services/firebase/firestore_services.dart';
import '../data/user_model.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthServices _authServices;
  final FirestoreServices _firestoreServices;
  SignupCubit(this._firestoreServices, this._authServices)
    : super(SignupState.signupInitial());

  //FocusNode
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmpasswordFocusNode = FocusNode();

  //TextEditingControllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  // late String uid = _authServices.currentUser?.uid ?? '1';



  // void emitSignupLoading(UserModel userData) async {
  //   emit(SignupState.signupLoading());
  //   try {
  //     final response = await _authServices.signUpWithEmailAndPassword(
  //       emailController.text,
  //       passwordController.text,
  //     );
  //     await _firestoreServices.setData(
  //       path: FirebasePaths.user(response!.uid),
  //       data: userData.toJson(),
  //     );
  //     emit(SignupState.signupSuccess(response));
  //   } catch (e) {
  //     emit(SignupState.signupFailure(e.toString()));
  //   }
  // }

  
  void emitSignupLoading() async {
    // ✅ التحقق من صحة البيانات
    if (!formKey.currentState!.validate()) {
      emit(SignupState.signupFailure('يرجى ملء جميع الحقول بشكل صحيح'));
      return;
    }

    emit(SignupState.signupLoading());
    
    try {
      // 1️⃣ التسجيل في Firebase Auth
      final User? user = await _authServices.signUpWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      
      // 2️⃣ التحقق من نجاح التسجيل
      if (user == null) {
        emit(SignupState.signupFailure('فشل إنشاء الحساب، يرجى المحاولة مرة أخرى'));
        return;
      }

      final userModel = UserModel(
        id: user.uid,                   
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        profilePictureUrl: null,        
      );
      
      
      await _firestoreServices.setData(
        path: FirebasePaths.user(user.uid),
        data: userModel.toJson(),
      );
      
      emit(SignupState.signupSuccess(user));
      
    } on FirebaseAuthException catch (e) {
      
      final String errorMessage = _getFirebaseErrorMessage(e);
      emit(SignupState.signupFailure(errorMessage));
      
    } catch (e) {
      
      emit(SignupState.signupFailure('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }

  String _getFirebaseErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مسجل بالفعل';
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح';
      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً (يجب أن تكون 6 أحرف على الأقل)';
      case 'network-request-failed':
        return 'تأكد من اتصالك بالإنترنت';
      default:
        return e.message ?? 'حدث خطأ، يرجى المحاولة مرة أخرى';
    }
  }
}
