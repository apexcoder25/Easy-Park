import 'package:easy_home/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreenController extends GetxController {
  // Text Controllers
  late TextEditingController emailManager;
  late TextEditingController passManager;
  late TextEditingController emailAdmin;
  late TextEditingController passAdmin;
  late TextEditingController emailStaff;
  late TextEditingController passStaff;

  // Obscure Text Toggles
  final obscureManager = true.obs;
  final obscureAdmin = true.obs;
  final obscureStaff = true.obs;

  @override
  void onInit() {
    super.onInit();

    emailManager = TextEditingController();
    passManager = TextEditingController();
    emailAdmin = TextEditingController();
    passAdmin = TextEditingController();
    emailStaff = TextEditingController();
    passStaff = TextEditingController();

    _initGoogleSignIn();
  }

  void _initGoogleSignIn() async {
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId:
            '575394412821-m5ji5u6l3aiptmi81mh9v03oea7bm637.apps.googleusercontent.com',
      );
    } catch (e) {
      print('GoogleSignIn initialization error: $e');
    }
  }

  @override
  void onClose() {
    emailManager.dispose();
    passManager.dispose();
    emailAdmin.dispose();
    passAdmin.dispose();
    emailStaff.dispose();
    passStaff.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void toggleObscureManager() => obscureManager.value = !obscureManager.value;
  void toggleObscureAdmin() => obscureAdmin.value = !obscureAdmin.value;
  void toggleObscureStaff() => obscureStaff.value = !obscureStaff.value;

  // ---------------- Manager Login ----------------
  void loginManager() {
    final email = emailManager.text.trim();
    final password = passManager.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password',
          snackPosition: SnackPosition.TOP);
      return;
    }

    print('Manager Login: $email');
    Get.toNamed(Routes.NEW_PARKING_REQUEST);
  }

  // ---------------- Admin Login ----------------
  void loginAdmin() {
    final email = emailAdmin.text.trim();
    final password = passAdmin.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password',
          snackPosition: SnackPosition.TOP);
      return;
    }

    print('Admin Login: $email');
    Get.toNamed(Routes.ADMIN_DASHBOARD);
  }

  // ---------------- Staff Login ----------------
  void loginStaff() {
    final email = emailStaff.text.trim();
    final password = passStaff.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password',
          snackPosition: SnackPosition.TOP);
      return;
    }

    print('Staff Login: $email');
    Get.toNamed(Routes.NEW_PARKING_REQUEST);
  }

  // ---------------- Google Sign-In ----------------
  Future<void> googleSignInManager() async {
    try {
      await GoogleSignIn.instance.signOut();
      await GoogleSignIn.instance.disconnect();

      final GoogleSignInAccount account = await GoogleSignIn.instance
          .authenticate(scopeHint: ['email', 'profile']);

      final idToken = account.authentication.idToken;

      print("Manager Google Sign-In successful: ${account.email}");
      print("ID Token: $idToken");

      Get.toNamed(Routes.NEW_PARKING_REQUEST);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        Get.snackbar(
          'Sign-In Cancelled',
          'Account re-authentication failed. Please try again.',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar('Google Sign-In Failed', e.toString(),
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> googleSignInAdmin() async {
    try {
      await GoogleSignIn.instance.signOut();
      await GoogleSignIn.instance.disconnect();

      final GoogleSignInAccount account = await GoogleSignIn.instance
          .authenticate(scopeHint: ['email', 'profile']);

      final idToken = account.authentication.idToken;

      print("Admin Google Sign-In successful: ${account.email}");
      print("ID Token: $idToken");

      Get.toNamed(Routes.ADMIN_DASHBOARD);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        Get.snackbar(
          'Sign-In Cancelled',
          'Account re-authentication failed. Please try again.',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar('Google Sign-In Failed', e.toString(),
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> googleSignInStaff() async {
    try {
      await GoogleSignIn.instance.signOut();
      await GoogleSignIn.instance.disconnect();

      final GoogleSignInAccount account = await GoogleSignIn.instance
          .authenticate(scopeHint: ['email', 'profile']);

      final idToken = account.authentication.idToken;

      print("Staff Google Sign-In successful: ${account.email}");
      print("ID Token: $idToken");

      Get.toNamed(Routes.NEW_PARKING_REQUEST);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        Get.snackbar(
          'Sign-In Cancelled',
          'Account re-authentication failed. Please try again.',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar('Google Sign-In Failed', e.toString(),
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.TOP);
    }
  }

  // ---------------- Apple Sign-In ----------------
  Future<void> appleSignInManager() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print('Apple Sign-In successful: ${credential.email}');
      print('User ID: ${credential.userIdentifier}');

      Get.toNamed(Routes.NEW_PARKING_REQUEST);
    } catch (e) {
      Get.snackbar('Apple Sign-In Failed', e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> appleSignInAdmin() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print('Apple Sign-In successful: ${credential.email}');
      print('User ID: ${credential.userIdentifier}');

      Get.toNamed(Routes.NEW_PARKING_REQUEST);
    } catch (e) {
      Get.snackbar('Apple Sign-In Failed', e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> appleSignInStaff() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print('Apple Sign-In successful: ${credential.email}');
      print('User ID: ${credential.userIdentifier}');

      Get.toNamed(Routes.NEW_PARKING_REQUEST);
    } catch (e) {
      Get.snackbar('Apple Sign-In Failed', e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }
}
