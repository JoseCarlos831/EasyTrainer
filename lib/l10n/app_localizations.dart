import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// Main headline text on the WelcomePage
  ///
  /// In en, this message translates to:
  /// **'WELCOME TO\nEASY TRAINER'**
  String get welcomePage_title;

  /// Motivational subtitle under the title on the WelcomePage
  ///
  /// In en, this message translates to:
  /// **'Become the best version of yourself with our fitness app!'**
  String get welcomePage_subtitle;

  /// Label of the button that navigates to the login screen on the WelcomePage
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get welcomePage_signInButton;

  /// Headline confirming password change
  ///
  /// In en, this message translates to:
  /// **'Password Changed!'**
  String get successPage_title;

  /// Confirmation message below the title
  ///
  /// In en, this message translates to:
  /// **'Your password has been changed successfully.'**
  String get successPage_description;

  /// Label of the button that navigates to the login screen
  ///
  /// In en, this message translates to:
  /// **'Back To Login'**
  String get successPage_backToLoginButton;

  /// Title on the register screen
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get registerPage_title;

  /// Hint text for username input
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get registerPage_usernameHint;

  /// Hint text for email input
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get registerPage_emailHint;

  /// Hint text for password input
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registerPage_passwordHint;

  /// Hint text for confirming password input
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get registerPage_confirmPasswordHint;

  /// Label for the registration submit button
  ///
  /// In en, this message translates to:
  /// **'Agree and Register'**
  String get registerPage_submitButton;

  /// Label shown above the social login buttons
  ///
  /// In en, this message translates to:
  /// **'Or Login with'**
  String get registerPage_socialLoginLabel;

  /// Validation message when a field is empty; use {field} as the field name
  ///
  /// In en, this message translates to:
  /// **'Enter {field}'**
  String registerPage_validatorRequired(String field);

  /// Validation message when password and confirmation do not match
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get registerPage_validatorPasswordsMatch;

  /// Main welcome message on the login screen
  ///
  /// In en, this message translates to:
  /// **'Welcome back!\nGlad to see you, Again!'**
  String get loginPage_welcomeMessage;

  /// Hint text for email input
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get loginPage_emailHint;

  /// Hint text for password input
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPage_passwordHint;

  /// Validation message when password field is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get loginPage_validatorPasswordRequired;

  /// Validation message when a general field is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter {field}'**
  String loginPage_validatorFieldRequired(String field);

  /// Validation message when the email format is invalid
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get loginPage_validatorEmailInvalid;

  /// Text for forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get loginPage_forgotPasswordLink;

  /// Label for the login button
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginPage_signInButton;

  /// Label above social login options
  ///
  /// In en, this message translates to:
  /// **'Or Login with'**
  String get loginPage_orLoginWith;

  /// Prompt before the register link
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginPage_registerPrompt;

  /// Text for the register link
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get loginPage_registerNowLink;

  /// Title on the forgot password screen
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordPage_title;

  /// Instructional text on the forgot password screen
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry! It occurs. Please enter the email address linked with your account.'**
  String get forgotPasswordPage_subtitle;

  /// Hint text for the email input field
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get forgotPasswordPage_emailHint;

  /// Label of the button that triggers password recovery
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get forgotPasswordPage_continueButton;

  /// Prompt before the login link
  ///
  /// In en, this message translates to:
  /// **'Remember Password?'**
  String get forgotPasswordPage_rememberPrompt;

  /// Text for the login button/link
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get forgotPasswordPage_loginButton;

  /// Snackbar feedback when email is invalid
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email.'**
  String get forgotPasswordPage_invalidEmailFeedback;

  /// Snackbar feedback when recovery email is sent
  ///
  /// In en, this message translates to:
  /// **'Recovery instructions sent to your email.'**
  String get forgotPasswordPage_successFeedback;

  /// Title for the verify email screen
  ///
  /// In en, this message translates to:
  /// **'Check your Email'**
  String get verifyEmailPage_title;

  /// Instruction text for the user to enter the code sent by email
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code we just sent on your email address.'**
  String get verifyEmailPage_instruction;

  /// Label for the button to verify the code
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get verifyEmailPage_continueButton;

  /// Prompt before the resend code link
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get verifyEmailPage_resendPrompt;

  /// Link to resend the verification code
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get verifyEmailPage_resendLink;

  /// Title of the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPage_title;

  /// Label for the option to update the user's password
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get settingsPage_updatePassword;

  /// Label for the option to delete the user's account
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get settingsPage_deleteAccount;

  /// Title shown at the top of the reset password screen
  ///
  /// In en, this message translates to:
  /// **'Check your Email'**
  String get resetPasswordPage_title;

  /// Instruction shown under the title on the reset password screen
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code we just sent on your email address.'**
  String get resetPasswordPage_instruction;

  /// Hint for the new password input field
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get resetPasswordPage_newPasswordHint;

  /// Hint for the confirm password input field
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get resetPasswordPage_confirmPasswordHint;

  /// Label for the button that submits the password reset
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordPage_resetButton;

  /// Message shown when password and confirmation do not match
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get resetPasswordPage_passwordMismatch;

  /// Title of the profile screen
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profilePage_title;

  /// Label for the edit profile option
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profilePage_editProfile;

  /// Label for the settings option
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profilePage_settings;

  /// Label for the logout option
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get profilePage_logout;

  /// Title of the logout confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get profilePage_logoutDialogTitle;

  /// Message in the logout confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get profilePage_logoutDialogMessage;

  /// Text on the confirm button in logout dialog
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get profilePage_logoutConfirmButton;

  /// Title of the password settings screen
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get passwordSettingsPage_title;

  /// Hint for the current password input
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get passwordSettingsPage_currentPassword;

  /// Text for the forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get passwordSettingsPage_forgotPasswordLink;

  /// Hint for the new password input
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get passwordSettingsPage_newPassword;

  /// Hint for the confirm new password input
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get passwordSettingsPage_confirmNewPassword;

  /// Label for the update password button
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get passwordSettingsPage_updateButton;

  /// Error message shown when the two new passwords do not match
  ///
  /// In en, this message translates to:
  /// **'New passwords do not match'**
  String get passwordSettingsPage_mismatchError;

  /// Snackbar message shown when password change is successful
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully!'**
  String get passwordSettingsPage_successMessage;

  /// Snackbar message shown when password change fails
  ///
  /// In en, this message translates to:
  /// **'Failed to change password.'**
  String get passwordSettingsPage_errorMessage;

  /// Title of the edit profile screen
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfilePage_title;

  /// Label for full name input
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get editProfilePage_fullNameLabel;

  /// Label for email input
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get editProfilePage_emailLabel;

  /// Label for phone input
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get editProfilePage_phoneLabel;

  /// Label for birthdate input
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get editProfilePage_birthdateLabel;

  /// Label for weight input
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get editProfilePage_weightLabel;

  /// Label for height input
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get editProfilePage_heightLabel;

  /// Option to select image from camera
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get editProfilePage_cameraOption;

  /// Option to select image from gallery
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get editProfilePage_galleryOption;

  /// Snackbar message after uploading an image
  ///
  /// In en, this message translates to:
  /// **'Image uploaded.'**
  String get editProfilePage_imageUploadedSnackbar;

  /// Button label to submit profile updates
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get editProfilePage_updateButton;

  /// Snackbar message after successful profile update
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get editProfilePage_successSnackbar;

  /// Snackbar message after failed profile update
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile.'**
  String get editProfilePage_errorSnackbar;

  /// Title on the delete account screen
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountPage_title;

  /// Warning message on the delete account screen
  ///
  /// In en, this message translates to:
  /// **'Deleting your account will permanently remove all your data.\nThis action cannot be undone.'**
  String get deleteAccountPage_warningText;

  /// Button to initiate account deletion
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get deleteAccountPage_deleteMyAccountButton;

  /// Label for cancel buttons
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deleteAccountPage_cancelButton;

  /// Title of the modal confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Delete your account?'**
  String get deleteAccountPage_modalTitle;

  /// Instructional text inside the confirmation modal
  ///
  /// In en, this message translates to:
  /// **'This action is permanent and cannot be undone.\nPlease confirm by typing your full name.'**
  String get deleteAccountPage_modalDescription;

  /// Label for the input field to confirm user's name
  ///
  /// In en, this message translates to:
  /// **'Your full name'**
  String get deleteAccountPage_fullNameInputLabel;

  /// Button inside the confirmation modal to delete account
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteAccountPage_modalDeleteButton;

  /// Snackbar message on successful account deletion
  ///
  /// In en, this message translates to:
  /// **'Account deleted successfully'**
  String get deleteAccountPage_successSnackbar;

  /// Snackbar message on failed account deletion
  ///
  /// In en, this message translates to:
  /// **'Failed to delete account'**
  String get deleteAccountPage_errorSnackbar;

  /// Title of the analytics upload screen
  ///
  /// In en, this message translates to:
  /// **'Upload a file'**
  String get analyticsPage_title;

  /// Instructional description below the title
  ///
  /// In en, this message translates to:
  /// **'Regulations require you to upload a national identity card. Don\'t worry, your data will stay safe and private.'**
  String get analyticsPage_description;

  /// Label shown when no file has been selected
  ///
  /// In en, this message translates to:
  /// **'Select file'**
  String get analyticsPage_selectFileLabel;

  /// Separator text between file and camera options
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get analyticsPage_orSeparator;

  /// Button label to open the camera and take a photo
  ///
  /// In en, this message translates to:
  /// **'Open Camera & Take Photo'**
  String get analyticsPage_openCameraButton;

  /// Label for the continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get analyticsPage_continueButton;

  /// Snackbar message after uploading a file
  ///
  /// In en, this message translates to:
  /// **'File uploaded successfully!'**
  String get analyticsPage_successSnackbar;

  /// Prefix for displaying the selected file name
  ///
  /// In en, this message translates to:
  /// **'File:'**
  String get analyticsPage_filePrefix;

  /// Message shown when no workouts match the search query
  ///
  /// In en, this message translates to:
  /// **'No workouts found.'**
  String get workoutSection_noWorkoutsFound;

  /// Placeholder text inside circular progress indicator
  ///
  /// In en, this message translates to:
  /// **'0%'**
  String get workoutSection_progressZero;

  /// Title of the notifications bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get homePage_notificationsTitle;

  /// Title of the notification about a new workout
  ///
  /// In en, this message translates to:
  /// **'New Workout'**
  String get homePage_notificationWorkoutTitle;

  /// Body text of the workout update notification
  ///
  /// In en, this message translates to:
  /// **'Your back workout was updated'**
  String get homePage_notificationWorkoutBody;

  /// Title of the notification for achieving a goal
  ///
  /// In en, this message translates to:
  /// **'Goal Achieved!'**
  String get homePage_notificationGoalTitle;

  /// Body text for the goal achievement notification
  ///
  /// In en, this message translates to:
  /// **'You\'ve completed 80% of your workouts this week.'**
  String get homePage_notificationGoalBody;

  /// Greeting the user by name
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}'**
  String homePage_greeting(String name);

  /// Prompt shown below the user's name
  ///
  /// In en, this message translates to:
  /// **'What\'s your plan for today?'**
  String get homePage_planPrompt;

  /// Title for the workout section
  ///
  /// In en, this message translates to:
  /// **'My Workout'**
  String get homePage_sectionWorkoutTitle;

  /// Title for the exercises section
  ///
  /// In en, this message translates to:
  /// **'My Exercises'**
  String get homePage_sectionExercisesTitle;

  /// Hint text in the search input field
  ///
  /// In en, this message translates to:
  /// **'Search Here'**
  String get homePage_searchHint;

  /// Label of the workout tab
  ///
  /// In en, this message translates to:
  /// **'Workout'**
  String get homePage_tabWorkout;

  /// Label of the exercises tab
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get homePage_tabExercises;

  /// Displayed when the FutureBuilder fails to load data
  ///
  /// In en, this message translates to:
  /// **'Failed to load data. Check your connection.'**
  String get homePage_errorLoadingMessage;

  /// Section title displayed above the list of modalities
  ///
  /// In en, this message translates to:
  /// **'Training'**
  String get exerciseSection_titleTraining;

  /// Button to clear selected modality filter
  ///
  /// In en, this message translates to:
  /// **'Clear Filter'**
  String get exerciseSection_clearFilterButton;

  /// Section title displayed above the list of exercises
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get exerciseSection_titleExercises;

  /// Displayed when no exercises match the search criteria
  ///
  /// In en, this message translates to:
  /// **'No exercises found.'**
  String get exerciseSection_noExercisesFound;

  /// Label for the number of sets in the exercise card
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get exerciseSection_setsLabel;

  /// Label for the number of repetitions in the exercise card
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get exerciseSection_repsLabel;

  /// Label for rest time in the exercise card
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get exerciseSection_restLabel;

  /// Title of the workout description section
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get workoutDetail_descriptionSectionTitle;

  /// Label for the workout duration info
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get workoutDetail_durationLabel;

  /// Label for the workout calories info
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get workoutDetail_caloriesLabel;

  /// Label for the number of workout days
  ///
  /// In en, this message translates to:
  /// **'Workout days'**
  String get workoutDetail_daysLabel;

  /// Title for the list of exercises directly associated with the workout
  ///
  /// In en, this message translates to:
  /// **'Direct exercises'**
  String get workoutDetail_directExercisesTitle;

  /// Title for the list of routines included in the workout
  ///
  /// In en, this message translates to:
  /// **'Routines'**
  String get workoutDetail_routinesTitle;

  /// Label showing the exercise names for the routine
  ///
  /// In en, this message translates to:
  /// **'Exercises: {preview}'**
  String workoutDetail_routineExercisesLabel(String preview);

  /// Label for the total duration of the routine
  ///
  /// In en, this message translates to:
  /// **'Time: {duration}'**
  String workoutDetail_routineTimeLabel(String duration);

  /// Label for total calories burned in the routine
  ///
  /// In en, this message translates to:
  /// **'Calories: {kcal} kcal'**
  String workoutDetail_routineCaloriesLabel(String kcal);

  /// Label shown when a duration is not defined
  ///
  /// In en, this message translates to:
  /// **'Undefined'**
  String get workoutDetail_durationUndefined;

  /// Label for the total duration of the routine
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get routineDetail_durationLabel;

  /// Label for the total calories of the routine
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get routineDetail_caloriesLabel;

  /// Formatted string for calories burned
  ///
  /// In en, this message translates to:
  /// **'{kcal} kcal'**
  String routineDetail_caloriesValue(String kcal);

  /// Section title for the description block
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get routineDetail_descriptionTitle;

  /// Section title for the list of exercises in the routine
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get routineDetail_exerciseTitle;

  /// Message displayed when the routine has no exercises
  ///
  /// In en, this message translates to:
  /// **'No exercises found.'**
  String get routineDetail_noExercises;

  /// Title in the AppBar for the exercise detail page
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get exerciseDetail_pageTitle;

  /// Label for exercise duration
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get exerciseDetail_labelDuration;

  /// Label for calories burned during exercise
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get exerciseDetail_labelCalories;

  /// Label for equipment used in exercise
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get exerciseDetail_labelEquipment;

  /// Label for the body part targeted by the exercise
  ///
  /// In en, this message translates to:
  /// **'Body part'**
  String get exerciseDetail_labelBodyPart;

  /// Displayed when no equipment is required
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get exerciseDetail_equipmentNone;

  /// Displayed when no body part is defined
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get exerciseDetail_bodyPartNotSpecified;

  /// Section title for description
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get exerciseDetail_sectionDescription;

  /// Section title for exercise execution steps
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get exerciseDetail_sectionSteps;

  /// Section title for recommended audience
  ///
  /// In en, this message translates to:
  /// **'Indicated for'**
  String get exerciseDetail_sectionIndicatedFor;

  /// Section title for safety tips
  ///
  /// In en, this message translates to:
  /// **'Safety tips'**
  String get exerciseDetail_sectionSafetyTips;

  /// Section title for common mistakes
  ///
  /// In en, this message translates to:
  /// **'Common mistakes'**
  String get exerciseDetail_sectionMistakes;

  /// Section title for contraindications
  ///
  /// In en, this message translates to:
  /// **'Contraindications'**
  String get exerciseDetail_sectionContraindications;

  /// Label for the option to change the app language
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get settingsPage_changeLanguage;

  /// Title of the page or dialog where the user selects the language
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get languagePicker_title;

  /// Label for the English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languagePicker_english;

  /// Label for the Portuguese language option
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get languagePicker_portuguese;

  /// Label for the Home tab
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get mainNavigation_labelHome;

  /// Label for the Analytics tab
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get mainNavigation_labelAnalytics;

  /// Label for the Profile tab
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get mainNavigation_labelProfile;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
