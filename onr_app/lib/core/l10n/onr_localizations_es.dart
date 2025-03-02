// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'onr_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get something_went_wrong_title => 'Algo salió mal';

  @override
  String get try_again_later_description => 'Inténtalo más tarde.';

  @override
  String get understood_button_text => 'Entendido';

  @override
  String get login_title => 'Login';

  @override
  String get login_button_lable => 'Continuar';

  @override
  String get email_input_label => 'Email';

  @override
  String get password_input_label => 'Contraseña';

  @override
  String get invalid_email_error_text => 'Email no valido';

  @override
  String get password_too_short_error_text => 'La contraseña es muy corta';

  @override
  String get empty_field_error_text => 'Campo vacio';
}
