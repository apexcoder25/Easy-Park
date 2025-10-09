import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:easy_home/app/core/widgets/custom_button.dart';
import 'package:easy_home/app/core/widgets/custom_text_field.dart';
import 'package:easy_home/app/modules/LoginScreen/controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginScreenController>();
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
         
          SingleChildScrollView(
            child: SafeArea(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Title - Centered with better spacing
                    Center(
                      child: Text(
                      'Easy Park',
                        style: AppTextStyles.titleLarge?.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                       
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Welcome subtitle for professionalism
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Welcome back! Please sign in to your account.',
                        style: AppTextStyles.heading?.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Card with tabs for better responsiveness (removed Expanded)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: screenHeight * 0.6, // Fixed height for consistency
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
                            // Tab bar - Improved styling for professional look
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
                                indicatorPadding: EdgeInsets.zero,
                                dividerColor: Colors.transparent,
                                tabs: const [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                    child: Tab(text: 'Manager'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                    child: Tab(text: 'Staff'),
                                  ),
                                ],
                              ),
                            ),
                            // Tab views with Expanded for full available space
                            Expanded(
                              child: TabBarView(
                                children: [
                                  // Manager form
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        // Icon for Manager tab
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary.withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.business_center_outlined,
                                            color: AppColors.primary,
                                            size: 32,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextField(
                                          hint: 'Email Address',
                                          icon: Icons.email_outlined,
                                          controller: controller.emailManager,
                                          keyboardType: TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTextField(
                                          hint: 'Password',
                                          icon: Icons.lock_outline,
                                          controller: controller.passManager,
                                          obscureText: controller.obscureManager.value,
                                          suffix: Obx(() => IconButton(
                                            onPressed: controller.toggleObscureManager,
                                            icon: Icon(
                                              controller.obscureManager.value ? Icons.visibility_off : Icons.visibility,
                                              color: AppColors.textSecondary,
                                            ),
                                          )),
                                        ),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              // TODO: Implement forgot password
                                              Get.snackbar(
                                                'Forgot Password',
                                                'Password reset link sent to your email.',
                                                snackPosition: SnackPosition.TOP,
                                                backgroundColor: AppColors.primary,
                                                colorText: Colors.white,
                                              );
                                            },
                                            child: Text(
                                              'Forgot Password?',
                                              style: AppTextStyles.label?.copyWith(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        CustomButton(
                                          text: 'Sign In as Manager',
                                          onTap: () {
                                            controller.loginManager();
                                          },
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                  // Staff form
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        // Icon for Staff tab
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: AppColors.accent.withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.group_outlined,
                                            color: AppColors.accent,
                                            size: 32,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextField(
                                          hint: 'Email Address',
                                          icon: Icons.email_outlined,
                                          controller: controller.emailStaff,
                                          keyboardType: TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTextField(
                                          hint: 'Password',
                                          icon: Icons.lock_outline,
                                          controller: controller.passStaff,
                                          obscureText: controller.obscureStaff.value,
                                          suffix: Obx(() => IconButton(
                                            onPressed: controller.toggleObscureStaff,
                                            icon: Icon(
                                              controller.obscureStaff.value ? Icons.visibility_off : Icons.visibility,
                                              color: AppColors.textSecondary,
                                            ),
                                          )),
                                        ),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              // TODO: Implement forgot password
                                              Get.snackbar(
                                                'Forgot Password',
                                                'Password reset link sent to your email.',
                                                snackPosition: SnackPosition.TOP,
                                                backgroundColor: AppColors.primary,
                                                colorText: Colors.white,
                                              );
                                            },
                                            child: Text(
                                              'Forgot Password?',
                                              style: AppTextStyles.label?.copyWith(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        CustomButton(
                                          text: 'Sign In as Staff',
                                          onTap: () {
                                            controller.loginStaff();
                                          },
                                        ),
                                        const SizedBox(height: 8),
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
                    const SizedBox(height: 40),
                    // Footer text for additional professionalism
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: AppTextStyles.label?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // TODO: Navigate to signup
                              print('Navigate to signup');
                            },
                            child: Text(
                              'Sign Up',
                              style: AppTextStyles.buttonText?.copyWith(
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