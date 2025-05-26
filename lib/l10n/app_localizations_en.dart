// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomePage_title => 'WELCOME TO\nEASY TRAINER';

  @override
  String get welcomePage_subtitle => 'Become the best version of yourself with our fitness app!';

  @override
  String get welcomePage_signInButton => 'Sign in';

  @override
  String get successPage_title => 'Password Changed!';

  @override
  String get successPage_description => 'Your password has been changed successfully.';

  @override
  String get successPage_backToLoginButton => 'Back To Login';

  @override
  String get registerPage_title => 'Sign up';

  @override
  String get registerPage_usernameHint => 'Username';

  @override
  String get registerPage_emailHint => 'Email';

  @override
  String get registerPage_passwordHint => 'Password';

  @override
  String get registerPage_confirmPasswordHint => 'Confirm password';

  @override
  String get registerPage_submitButton => 'Agree and Register';

  @override
  String get registerPage_socialLoginLabel => 'Or Login with';

  @override
  String registerPage_validatorRequired(String field) {
    return 'Enter $field';
  }

  @override
  String get registerPage_validatorPasswordsMatch => 'Passwords do not match';

  @override
  String get loginPage_welcomeMessage => 'Welcome back!\nGlad to see you, Again!';

  @override
  String get loginPage_emailHint => 'Enter your email';

  @override
  String get loginPage_passwordHint => 'Enter your password';

  @override
  String get loginPage_validatorPasswordRequired => 'Please enter your password';

  @override
  String loginPage_validatorFieldRequired(String field) {
    return 'Please enter $field';
  }

  @override
  String get loginPage_validatorEmailInvalid => 'Enter a valid email';

  @override
  String get loginPage_forgotPasswordLink => 'Forgot Password?';

  @override
  String get loginPage_signInButton => 'Sign in';

  @override
  String get loginPage_orLoginWith => 'Or Login with';

  @override
  String get loginPage_registerPrompt => 'Don\'t have an account?';

  @override
  String get loginPage_registerNowLink => 'Register Now';

  @override
  String get forgotPasswordPage_title => 'Forgot Password?';

  @override
  String get forgotPasswordPage_subtitle => 'Don\'t worry! It occurs. Please enter the email address linked with your account.';

  @override
  String get forgotPasswordPage_emailHint => 'Enter your email';

  @override
  String get forgotPasswordPage_continueButton => 'Continue';

  @override
  String get forgotPasswordPage_rememberPrompt => 'Remember Password?';

  @override
  String get forgotPasswordPage_loginButton => 'Login';

  @override
  String get forgotPasswordPage_invalidEmailFeedback => 'Please enter a valid email.';

  @override
  String get forgotPasswordPage_successFeedback => 'Recovery instructions sent to your email.';

  @override
  String get verifyEmailPage_title => 'Check your Email';

  @override
  String get verifyEmailPage_instruction => 'Enter the verification code we just sent on your email address.';

  @override
  String get verifyEmailPage_continueButton => 'Continue';

  @override
  String get verifyEmailPage_resendPrompt => 'Didn\'t receive code?';

  @override
  String get verifyEmailPage_resendLink => 'Resend';

  @override
  String get settingsPage_title => 'Settings';

  @override
  String get settingsPage_updatePassword => 'Update Password';

  @override
  String get settingsPage_deleteAccount => 'Delete Account';

  @override
  String get resetPasswordPage_title => 'Check your Email';

  @override
  String get resetPasswordPage_instruction => 'Enter the verification code we just sent on your email address.';

  @override
  String get resetPasswordPage_newPasswordHint => 'New Password';

  @override
  String get resetPasswordPage_confirmPasswordHint => 'Confirm Password';

  @override
  String get resetPasswordPage_resetButton => 'Reset Password';

  @override
  String get resetPasswordPage_passwordMismatch => 'Passwords do not match';

  @override
  String get profilePage_title => 'Profile';

  @override
  String get profilePage_editProfile => 'Edit Profile';

  @override
  String get profilePage_settings => 'Settings';

  @override
  String get profilePage_logout => 'Log Out';

  @override
  String get profilePage_logoutDialogTitle => 'Log Out';

  @override
  String get profilePage_logoutDialogMessage => 'Are you sure you want to log out?';

  @override
  String get profilePage_logoutConfirmButton => 'Confirm';

  @override
  String get passwordSettingsPage_title => 'Update Password';

  @override
  String get passwordSettingsPage_currentPassword => 'Current Password';

  @override
  String get passwordSettingsPage_forgotPasswordLink => 'Forgot your password?';

  @override
  String get passwordSettingsPage_newPassword => 'New Password';

  @override
  String get passwordSettingsPage_confirmNewPassword => 'Confirm New Password';

  @override
  String get passwordSettingsPage_updateButton => 'Update Password';

  @override
  String get passwordSettingsPage_mismatchError => 'New passwords do not match';

  @override
  String get passwordSettingsPage_successMessage => 'Password changed successfully!';

  @override
  String get passwordSettingsPage_errorMessage => 'Failed to change password.';

  @override
  String get editProfilePage_title => 'Edit Profile';

  @override
  String get editProfilePage_fullNameLabel => 'Full Name';

  @override
  String get editProfilePage_emailLabel => 'Email';

  @override
  String get editProfilePage_phoneLabel => 'Phone Number';

  @override
  String get editProfilePage_birthdateLabel => 'Date of Birth';

  @override
  String get editProfilePage_weightLabel => 'Weight (kg)';

  @override
  String get editProfilePage_heightLabel => 'Height (cm)';

  @override
  String get editProfilePage_cameraOption => 'Camera';

  @override
  String get editProfilePage_galleryOption => 'Gallery';

  @override
  String get editProfilePage_imageUploadedSnackbar => 'Image uploaded.';

  @override
  String get editProfilePage_updateButton => 'Update Profile';

  @override
  String get editProfilePage_successSnackbar => 'Profile updated successfully!';

  @override
  String get editProfilePage_errorSnackbar => 'Failed to update profile.';

  @override
  String get deleteAccountPage_title => 'Delete Account';

  @override
  String get deleteAccountPage_warningText => 'Deleting your account will permanently remove all your data.\nThis action cannot be undone.';

  @override
  String get deleteAccountPage_deleteMyAccountButton => 'Delete My Account';

  @override
  String get deleteAccountPage_cancelButton => 'Cancel';

  @override
  String get deleteAccountPage_modalTitle => 'Delete your account?';

  @override
  String get deleteAccountPage_modalDescription => 'This action is permanent and cannot be undone.\nPlease confirm by typing your full name.';

  @override
  String get deleteAccountPage_fullNameInputLabel => 'Your full name';

  @override
  String get deleteAccountPage_modalDeleteButton => 'Delete';

  @override
  String get deleteAccountPage_successSnackbar => 'Account deleted successfully';

  @override
  String get deleteAccountPage_errorSnackbar => 'Failed to delete account';

  @override
  String get analyticsPage_title => 'Upload a file';

  @override
  String get analyticsPage_description => 'Regulations require you to upload a national identity card. Don\'t worry, your data will stay safe and private.';

  @override
  String get analyticsPage_selectFileLabel => 'Select file';

  @override
  String get analyticsPage_orSeparator => 'or';

  @override
  String get analyticsPage_openCameraButton => 'Open Camera & Take Photo';

  @override
  String get analyticsPage_continueButton => 'Continue';

  @override
  String get analyticsPage_successSnackbar => 'File uploaded successfully!';

  @override
  String get analyticsPage_filePrefix => 'File:';

  @override
  String get workoutSection_noWorkoutsFound => 'No workouts found.';

  @override
  String get workoutSection_progressZero => '0%';

  @override
  String get homePage_notificationsTitle => 'Notifications';

  @override
  String get homePage_notificationWorkoutTitle => 'New Workout';

  @override
  String get homePage_notificationWorkoutBody => 'Your back workout was updated';

  @override
  String get homePage_notificationGoalTitle => 'Goal Achieved!';

  @override
  String get homePage_notificationGoalBody => 'You\'ve completed 80% of your workouts this week.';

  @override
  String homePage_greeting(String name) {
    return 'Hi, $name';
  }

  @override
  String get homePage_planPrompt => 'What\'s your plan for today?';

  @override
  String get homePage_sectionWorkoutTitle => 'My Workout';

  @override
  String get homePage_sectionExercisesTitle => 'My Exercises';

  @override
  String get homePage_searchHint => 'Search Here';

  @override
  String get homePage_tabWorkout => 'Workout';

  @override
  String get homePage_tabExercises => 'Exercises';

  @override
  String get homePage_errorLoadingMessage => 'Failed to load data. Check your connection.';

  @override
  String get exerciseSection_titleTraining => 'Training';

  @override
  String get exerciseSection_clearFilterButton => 'Clear Filter';

  @override
  String get exerciseSection_titleExercises => 'Exercises';

  @override
  String get exerciseSection_noExercisesFound => 'No exercises found.';

  @override
  String get exerciseSection_setsLabel => 'Sets';

  @override
  String get exerciseSection_repsLabel => 'Reps';

  @override
  String get exerciseSection_restLabel => 'Rest';

  @override
  String get workoutDetail_descriptionSectionTitle => 'Description';

  @override
  String get workoutDetail_durationLabel => 'Duration';

  @override
  String get workoutDetail_caloriesLabel => 'Calories';

  @override
  String get workoutDetail_daysLabel => 'Workout days';

  @override
  String get workoutDetail_directExercisesTitle => 'Direct exercises';

  @override
  String get workoutDetail_routinesTitle => 'Routines';

  @override
  String workoutDetail_routineExercisesLabel(String preview) {
    return 'Exercises: $preview';
  }

  @override
  String workoutDetail_routineTimeLabel(String duration) {
    return 'Time: $duration';
  }

  @override
  String workoutDetail_routineCaloriesLabel(String kcal) {
    return 'Calories: $kcal kcal';
  }

  @override
  String get workoutDetail_durationUndefined => 'Undefined';

  @override
  String get routineDetail_durationLabel => 'Duration';

  @override
  String get routineDetail_caloriesLabel => 'Calories';

  @override
  String routineDetail_caloriesValue(String kcal) {
    return '$kcal kcal';
  }

  @override
  String get routineDetail_descriptionTitle => 'Description';

  @override
  String get routineDetail_exerciseTitle => 'Exercises';

  @override
  String get routineDetail_noExercises => 'No exercises found.';

  @override
  String get exerciseDetail_pageTitle => 'Exercise';

  @override
  String get exerciseDetail_labelDuration => 'Duration';

  @override
  String get exerciseDetail_labelCalories => 'Calories';

  @override
  String get exerciseDetail_labelEquipment => 'Equipment';

  @override
  String get exerciseDetail_labelBodyPart => 'Body part';

  @override
  String get exerciseDetail_equipmentNone => 'None';

  @override
  String get exerciseDetail_bodyPartNotSpecified => 'Not specified';

  @override
  String get exerciseDetail_sectionDescription => 'Description';

  @override
  String get exerciseDetail_sectionSteps => 'Steps';

  @override
  String get exerciseDetail_sectionIndicatedFor => 'Indicated for';

  @override
  String get exerciseDetail_sectionSafetyTips => 'Safety tips';

  @override
  String get exerciseDetail_sectionMistakes => 'Common mistakes';

  @override
  String get exerciseDetail_sectionContraindications => 'Contraindications';

  @override
  String get settingsPage_changeLanguage => 'Change Language';

  @override
  String get languagePicker_title => 'Select Language';

  @override
  String get languagePicker_english => 'English';

  @override
  String get languagePicker_portuguese => 'Portuguese';

  @override
  String get mainNavigation_labelHome => 'Home';

  @override
  String get mainNavigation_labelAnalytics => 'Analytics';

  @override
  String get mainNavigation_labelProfile => 'Profile';
}
