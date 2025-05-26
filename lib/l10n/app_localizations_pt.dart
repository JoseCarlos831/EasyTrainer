// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get welcomePage_title => 'BEM-VINDO AO\nEASY TRAINER';

  @override
  String get welcomePage_subtitle => 'Torne-se a melhor versão de si mesmo com nosso app de treino!';

  @override
  String get welcomePage_signInButton => 'Entrar';

  @override
  String get successPage_title => 'Senha alterada!';

  @override
  String get successPage_description => 'Sua senha foi alterada com sucesso.';

  @override
  String get successPage_backToLoginButton => 'Voltar para o login';

  @override
  String get registerPage_title => 'Registrar';

  @override
  String get registerPage_usernameHint => 'Nome de usuário';

  @override
  String get registerPage_emailHint => 'Email';

  @override
  String get registerPage_passwordHint => 'Senha';

  @override
  String get registerPage_confirmPasswordHint => 'Confirmar senha';

  @override
  String get registerPage_submitButton => 'Concordar e registrar';

  @override
  String get registerPage_socialLoginLabel => 'Ou entre com';

  @override
  String registerPage_validatorRequired(String field) {
    return 'Preencha o campo $field';
  }

  @override
  String get registerPage_validatorPasswordsMatch => 'As senhas não coincidem';

  @override
  String get loginPage_welcomeMessage => 'Bem-vindo de volta!\nFicamos felizes em vê-lo novamente!';

  @override
  String get loginPage_emailHint => 'Digite seu email';

  @override
  String get loginPage_passwordHint => 'Digite sua senha';

  @override
  String get loginPage_validatorPasswordRequired => 'Por favor, digite sua senha';

  @override
  String loginPage_validatorFieldRequired(String field) {
    return 'Por favor, preencha o campo $field';
  }

  @override
  String get loginPage_validatorEmailInvalid => 'Digite um email válido';

  @override
  String get loginPage_forgotPasswordLink => 'Esqueceu a senha?';

  @override
  String get loginPage_signInButton => 'Entrar';

  @override
  String get loginPage_orLoginWith => 'Ou entre com';

  @override
  String get loginPage_registerPrompt => 'Não tem uma conta?';

  @override
  String get loginPage_registerNowLink => 'Cadastre-se agora';

  @override
  String get forgotPasswordPage_title => 'Esqueceu a senha?';

  @override
  String get forgotPasswordPage_subtitle => 'Não se preocupe! Isso acontece. Por favor, digite o email vinculado à sua conta.';

  @override
  String get forgotPasswordPage_emailHint => 'Digite seu email';

  @override
  String get forgotPasswordPage_continueButton => 'Continuar';

  @override
  String get forgotPasswordPage_rememberPrompt => 'Lembrou a senha?';

  @override
  String get forgotPasswordPage_loginButton => 'Entrar';

  @override
  String get forgotPasswordPage_invalidEmailFeedback => 'Por favor, digite um email válido.';

  @override
  String get forgotPasswordPage_successFeedback => 'Instruções de recuperação enviadas para seu email.';

  @override
  String get verifyEmailPage_title => 'Verifique seu Email';

  @override
  String get verifyEmailPage_instruction => 'Digite o código de verificação que acabamos de enviar para seu email.';

  @override
  String get verifyEmailPage_continueButton => 'Continuar';

  @override
  String get verifyEmailPage_resendPrompt => 'Não recebeu o código?';

  @override
  String get verifyEmailPage_resendLink => 'Reenviar';

  @override
  String get settingsPage_title => 'Configurações';

  @override
  String get settingsPage_updatePassword => 'Atualizar Senha';

  @override
  String get settingsPage_deleteAccount => 'Excluir Conta';

  @override
  String get resetPasswordPage_title => 'Verifique seu Email';

  @override
  String get resetPasswordPage_instruction => 'Digite o código de verificação que acabamos de enviar para seu email.';

  @override
  String get resetPasswordPage_newPasswordHint => 'Nova Senha';

  @override
  String get resetPasswordPage_confirmPasswordHint => 'Confirmar Senha';

  @override
  String get resetPasswordPage_resetButton => 'Redefinir Senha';

  @override
  String get resetPasswordPage_passwordMismatch => 'As senhas não coincidem';

  @override
  String get profilePage_title => 'Perfil';

  @override
  String get profilePage_editProfile => 'Editar Perfil';

  @override
  String get profilePage_settings => 'Configurações';

  @override
  String get profilePage_logout => 'Sair';

  @override
  String get profilePage_logoutDialogTitle => 'Sair';

  @override
  String get profilePage_logoutDialogMessage => 'Você tem certeza que deseja sair?';

  @override
  String get profilePage_logoutConfirmButton => 'Confirmar';

  @override
  String get passwordSettingsPage_title => 'Atualizar Senha';

  @override
  String get passwordSettingsPage_currentPassword => 'Senha Atual';

  @override
  String get passwordSettingsPage_forgotPasswordLink => 'Esqueceu sua senha?';

  @override
  String get passwordSettingsPage_newPassword => 'Nova Senha';

  @override
  String get passwordSettingsPage_confirmNewPassword => 'Confirmar Nova Senha';

  @override
  String get passwordSettingsPage_updateButton => 'Atualizar Senha';

  @override
  String get passwordSettingsPage_mismatchError => 'As novas senhas não coincidem';

  @override
  String get passwordSettingsPage_successMessage => 'Senha atualizada com sucesso!';

  @override
  String get passwordSettingsPage_errorMessage => 'Falha ao atualizar a senha.';

  @override
  String get editProfilePage_title => 'Editar Perfil';

  @override
  String get editProfilePage_fullNameLabel => 'Nome Completo';

  @override
  String get editProfilePage_emailLabel => 'Email';

  @override
  String get editProfilePage_phoneLabel => 'Número de Telefone';

  @override
  String get editProfilePage_birthdateLabel => 'Data de Nascimento';

  @override
  String get editProfilePage_weightLabel => 'Peso (kg)';

  @override
  String get editProfilePage_heightLabel => 'Altura (cm)';

  @override
  String get editProfilePage_cameraOption => 'Câmera';

  @override
  String get editProfilePage_galleryOption => 'Galeria';

  @override
  String get editProfilePage_imageUploadedSnackbar => 'Imagem carregada.';

  @override
  String get editProfilePage_updateButton => 'Atualizar Perfil';

  @override
  String get editProfilePage_successSnackbar => 'Perfil atualizado com sucesso!';

  @override
  String get editProfilePage_errorSnackbar => 'Erro ao atualizar perfil.';

  @override
  String get deleteAccountPage_title => 'Excluir Conta';

  @override
  String get deleteAccountPage_warningText => 'Excluir sua conta removerá permanentemente todos os seus dados.\nEssa ação não pode ser desfeita.';

  @override
  String get deleteAccountPage_deleteMyAccountButton => 'Excluir Minha Conta';

  @override
  String get deleteAccountPage_cancelButton => 'Cancelar';

  @override
  String get deleteAccountPage_modalTitle => 'Deseja excluir sua conta?';

  @override
  String get deleteAccountPage_modalDescription => 'Essa ação é permanente e não poderá ser desfeita.\nConfirme digitando seu nome completo.';

  @override
  String get deleteAccountPage_fullNameInputLabel => 'Seu nome completo';

  @override
  String get deleteAccountPage_modalDeleteButton => 'Excluir';

  @override
  String get deleteAccountPage_successSnackbar => 'Conta excluída com sucesso';

  @override
  String get deleteAccountPage_errorSnackbar => 'Falha ao excluir a conta';

  @override
  String get analyticsPage_title => 'Enviar um arquivo';

  @override
  String get analyticsPage_description => 'Regulamentos exigem que você envie um documento de identidade. Não se preocupe, seus dados estarão seguros e privados.';

  @override
  String get analyticsPage_selectFileLabel => 'Selecionar arquivo';

  @override
  String get analyticsPage_orSeparator => 'ou';

  @override
  String get analyticsPage_openCameraButton => 'Abrir câmera e tirar foto';

  @override
  String get analyticsPage_continueButton => 'Continuar';

  @override
  String get analyticsPage_successSnackbar => 'Arquivo enviado com sucesso!';

  @override
  String get analyticsPage_filePrefix => 'Arquivo:';

  @override
  String get workoutSection_noWorkoutsFound => 'Nenhum treino encontrado.';

  @override
  String get workoutSection_progressZero => '0%';

  @override
  String get homePage_notificationsTitle => 'Notificações';

  @override
  String get homePage_notificationWorkoutTitle => 'Novo Treino';

  @override
  String get homePage_notificationWorkoutBody => 'Seu treino de costas foi atualizado';

  @override
  String get homePage_notificationGoalTitle => 'Meta Alcançada!';

  @override
  String get homePage_notificationGoalBody => 'Você completou 80% dos seus treinos esta semana.';

  @override
  String homePage_greeting(String name) {
    return 'Olá, $name';
  }

  @override
  String get homePage_planPrompt => 'Qual é o seu plano para hoje?';

  @override
  String get homePage_sectionWorkoutTitle => 'Meus Treinos';

  @override
  String get homePage_sectionExercisesTitle => 'Meus Exercícios';

  @override
  String get homePage_searchHint => 'Buscar Aqui';

  @override
  String get homePage_tabWorkout => 'Treinos';

  @override
  String get homePage_tabExercises => 'Exercícios';

  @override
  String get homePage_errorLoadingMessage => 'Falha ao carregar os dados. Verifique sua conexão.';

  @override
  String get exerciseSection_titleTraining => 'Treinamento';

  @override
  String get exerciseSection_clearFilterButton => 'Limpar Filtro';

  @override
  String get exerciseSection_titleExercises => 'Exercícios';

  @override
  String get exerciseSection_noExercisesFound => 'Nenhum exercício encontrado.';

  @override
  String get exerciseSection_setsLabel => 'Séries';

  @override
  String get exerciseSection_repsLabel => 'Repetições';

  @override
  String get exerciseSection_restLabel => 'Descanso';

  @override
  String get workoutDetail_descriptionSectionTitle => 'Descrição';

  @override
  String get workoutDetail_durationLabel => 'Duração';

  @override
  String get workoutDetail_caloriesLabel => 'Calorias';

  @override
  String get workoutDetail_daysLabel => 'Dias de treino';

  @override
  String get workoutDetail_directExercisesTitle => 'Exercícios diretos';

  @override
  String get workoutDetail_routinesTitle => 'Rotinas';

  @override
  String workoutDetail_routineExercisesLabel(String preview) {
    return 'Exercícios: $preview';
  }

  @override
  String workoutDetail_routineTimeLabel(String duration) {
    return 'Tempo: $duration';
  }

  @override
  String workoutDetail_routineCaloriesLabel(String kcal) {
    return 'Calorias: $kcal kcal';
  }

  @override
  String get workoutDetail_durationUndefined => 'Não definida';

  @override
  String get routineDetail_durationLabel => 'Duração';

  @override
  String get routineDetail_caloriesLabel => 'Calorias';

  @override
  String routineDetail_caloriesValue(String kcal) {
    return '$kcal kcal';
  }

  @override
  String get routineDetail_descriptionTitle => 'Descrição';

  @override
  String get routineDetail_exerciseTitle => 'Exercícios';

  @override
  String get routineDetail_noExercises => 'Nenhum exercício encontrado.';

  @override
  String get exerciseDetail_pageTitle => 'Exercício';

  @override
  String get exerciseDetail_labelDuration => 'Duração';

  @override
  String get exerciseDetail_labelCalories => 'Calorias';

  @override
  String get exerciseDetail_labelEquipment => 'Equipamento';

  @override
  String get exerciseDetail_labelBodyPart => 'Parte do corpo';

  @override
  String get exerciseDetail_equipmentNone => 'Nenhum';

  @override
  String get exerciseDetail_bodyPartNotSpecified => 'Não especificado';

  @override
  String get exerciseDetail_sectionDescription => 'Descrição';

  @override
  String get exerciseDetail_sectionSteps => 'Passos';

  @override
  String get exerciseDetail_sectionIndicatedFor => 'Indicado para';

  @override
  String get exerciseDetail_sectionSafetyTips => 'Dicas de segurança';

  @override
  String get exerciseDetail_sectionMistakes => 'Erros comuns';

  @override
  String get exerciseDetail_sectionContraindications => 'Contraindicações';

  @override
  String get settingsPage_changeLanguage => 'Alterar Idioma';

  @override
  String get languagePicker_title => 'Selecionar Idioma';

  @override
  String get languagePicker_english => 'Inglês';

  @override
  String get languagePicker_portuguese => 'Português';

  @override
  String get mainNavigation_labelHome => 'Início';

  @override
  String get mainNavigation_labelAnalytics => 'Análises';

  @override
  String get mainNavigation_labelProfile => 'Perfil';
}
