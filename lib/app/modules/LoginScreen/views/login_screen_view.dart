import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:easy_home/app/core/widgets/custom_button.dart';
import 'package:easy_home/app/core/widgets/custom_text_field.dart';
import 'package:easy_home/app/modules/LoginScreen/controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginScreenController>();
    final screenHeight = MediaQuery.of(context).size.height;
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Title
                    Center(
                      child: Text(
                        'Qik Park',
                        style: AppTextStyles.titleLarge.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Welcome back! Please sign in to your account.',
                        style: AppTextStyles.heading.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Main Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: screenHeight * 0.65,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Tabs
                            Container(
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                              child: TabBar(
                                indicator: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary.withOpacity(0.3),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: AppColors.textSecondary,
                                labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                unselectedLabelStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                indicatorPadding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 8),
                                dividerColor: Colors.transparent,
                                tabs: const [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Tab(text: 'Admin'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Tab(text: 'Manager'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Tab(text: 'Staff'),
                                  ),
                                ],
                              ),
                            ),

                            // Tab Views
                            Expanded(
                              child: TabBarView(
                                children: [
                                  // ========== ADMIN LOGIN ==========
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary
                                                .withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.admin_panel_settings_outlined,
                                            color: AppColors.primary,
                                            size: 32,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        CustomTextField(
                                          hint: 'Email Address',
                                          icon: Icons.email_outlined,
                                          controller: controller.emailAdmin,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextField(
                                          hint: 'Password',
                                          icon: Icons.lock_outline,
                                          controller: controller.passAdmin,
                                          obscureText:
                                              controller.obscureAdmin.value,
                                          suffix: Obx(
                                            () => IconButton(
                                              onPressed:
                                                  controller.toggleObscureAdmin,
                                              icon: Icon(
                                                controller.obscureAdmin.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              Get.snackbar(
                                                'Forgot Password',
                                                'Password reset link sent to your email.',
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor:
                                                    AppColors.primary,
                                                colorText: Colors.white,
                                              );
                                            },
                                            child: Text(
                                              'Forgot Password?',
                                              style:
                                                  AppTextStyles.label.copyWith(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),

                                        CustomButton(
                                          text: 'Sign In as Admin',
                                          onTap: () {
                                            controller.loginAdmin();
                                          },
                                        ),
                                        const SizedBox(height: 12),

                                        // Divider + OR before social sign-ins
                                        Row(
                                          children: [
                                            const Expanded(
                                                child: Divider(thickness: 1)),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                'OR',
                                                style: TextStyle(
                                                  color: AppColors.textSecondary
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            const Expanded(
                                                child: Divider(thickness: 1)),
                                          ],
                                        ),
                                        const SizedBox(height: 12),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (isAndroid)
                                              _SocialButton(
                                                icon: FontAwesomeIcons.google,
                                                label: "Google",
                                                color: Colors.white,
                                                borderColor:
                                                    Colors.grey.shade300,
                                                textColor: Colors.black87,
                                                onTap: () => controller
                                                    .googleSignInAdmin(),
                                              )
                                            else if (isIOS)
                                              _SocialButton(
                                                icon: FontAwesomeIcons.apple,
                                                label: "Apple",
                                                color: Colors.black,
                                                borderColor: Colors.black,
                                                textColor: Colors.white,
                                                onTap: () => controller
                                                    .appleSignInAdmin(),
                                              )
                                            else
                                              const SizedBox.shrink(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ========== MANAGER LOGIN ==========
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary
                                                .withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.business_center_outlined,
                                            color: AppColors.primary,
                                            size: 32,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        CustomTextField(
                                          hint: 'Email Address',
                                          icon: Icons.email_outlined,
                                          controller: controller.emailManager,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextField(
                                          hint: 'Password',
                                          icon: Icons.lock_outline,
                                          controller: controller.passManager,
                                          obscureText:
                                              controller.obscureManager.value,
                                          suffix: Obx(
                                            () => IconButton(
                                              onPressed: controller
                                                  .toggleObscureManager,
                                              icon: Icon(
                                                controller.obscureManager.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              Get.snackbar(
                                                'Forgot Password',
                                                'Password reset link sent to your email.',
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor:
                                                    AppColors.primary,
                                                colorText: Colors.white,
                                              );
                                            },
                                            child: Text(
                                              'Forgot Password?',
                                              style:
                                                  AppTextStyles.label.copyWith(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),

                                        CustomButton(
                                          text: 'Sign In as Manager',
                                          onTap: () {
                                            controller.loginManager();
                                          },
                                        ),
                                        const SizedBox(height: 12),

                                        // (Removed divider for Manager)

                                        // Social Buttons (Manager) - only Apple on iOS
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (isIOS)
                                              _SocialButton(
                                                icon: FontAwesomeIcons.apple,
                                                label: "Apple",
                                                color: Colors.black,
                                                borderColor: Colors.black,
                                                textColor: Colors.white,
                                                onTap: () => controller
                                                    .appleSignInManager(),
                                              )
                                            else
                                              const SizedBox.shrink(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ========== STAFF LOGIN ==========
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: AppColors.accent
                                                .withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.group_outlined,
                                            color: AppColors.accent,
                                            size: 32,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        CustomTextField(
                                          hint: 'Email Address',
                                          icon: Icons.email_outlined,
                                          controller: controller.emailStaff,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextField(
                                          hint: 'Password',
                                          icon: Icons.lock_outline,
                                          controller: controller.passStaff,
                                          obscureText:
                                              controller.obscureStaff.value,
                                          suffix: Obx(
                                            () => IconButton(
                                              onPressed:
                                                  controller.toggleObscureStaff,
                                              icon: Icon(
                                                controller.obscureStaff.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              Get.snackbar(
                                                'Forgot Password',
                                                'Password reset link sent to your email.',
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor:
                                                    AppColors.primary,
                                                colorText: Colors.white,
                                              );
                                            },
                                            child: Text(
                                              'Forgot Password?',
                                              style:
                                                  AppTextStyles.label.copyWith(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        CustomButton(
                                          text: 'Sign In as Staff',
                                          onTap: () {
                                            controller.loginStaff();
                                          },
                                        ),
                                        // (Removed divider for Staff)

                                        // Social Buttons (Staff) - only Apple on iOS
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (isIOS)
                                              _SocialButton(
                                                icon: FontAwesomeIcons.apple,
                                                label: "Apple",
                                                color: Colors.black,
                                                borderColor: Colors.black,
                                                textColor: Colors.white,
                                                onTap: () => controller
                                                    .appleSignInStaff(),
                                              )
                                            else
                                              const SizedBox.shrink(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Footer
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: AppTextStyles.label.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Navigate to signup');
                            },
                            child: Text(
                              'Sign Up',
                              style: AppTextStyles.buttonText.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            FaIcon(icon, color: textColor, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
