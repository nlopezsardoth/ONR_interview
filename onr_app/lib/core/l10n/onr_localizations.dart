import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'onr_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/onr_localizations.dart';
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
    Locale('es')
  ];

  /// No description provided for @something_went_wrong_title.
  ///
  /// In es, this message translates to:
  /// **'Algo salió mal'**
  String get something_went_wrong_title;

  /// No description provided for @try_again.
  ///
  /// In es, this message translates to:
  /// **'trata de nuevo'**
  String get try_again;

  /// No description provided for @try_again_later_description.
  ///
  /// In es, this message translates to:
  /// **'Inténtalo más tarde.'**
  String get try_again_later_description;

  /// No description provided for @understood_button_text.
  ///
  /// In es, this message translates to:
  /// **'Entendido'**
  String get understood_button_text;

  /// No description provided for @login_title.
  ///
  /// In es, this message translates to:
  /// **'Login'**
  String get login_title;

  /// No description provided for @login_button_lable.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get login_button_lable;

  /// No description provided for @email_input_label.
  ///
  /// In es, this message translates to:
  /// **'Email'**
  String get email_input_label;

  /// No description provided for @password_input_label.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get password_input_label;

  /// No description provided for @invalid_email_error_text.
  ///
  /// In es, this message translates to:
  /// **'Email no valido'**
  String get invalid_email_error_text;

  /// No description provided for @password_too_short_error_text.
  ///
  /// In es, this message translates to:
  /// **'La contraseña es muy corta'**
  String get password_too_short_error_text;

  /// No description provided for @empty_field_error_text.
  ///
  /// In es, this message translates to:
  /// **'Campo vacio'**
  String get empty_field_error_text;

  /// No description provided for @products_tile.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get products_tile;

  /// No description provided for @title_label.
  ///
  /// In es, this message translates to:
  /// **'Título'**
  String get title_label;

  /// No description provided for @category_label.
  ///
  /// In es, this message translates to:
  /// **'Categoría'**
  String get category_label;

  /// No description provided for @price_label.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get price_label;

  /// No description provided for @rating_label.
  ///
  /// In es, this message translates to:
  /// **'Rating'**
  String get rating_label;

  /// No description provided for @cant_load_products_title.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar tus productos'**
  String get cant_load_products_title;

  /// No description provided for @cant_load_product_title.
  ///
  /// In es, this message translates to:
  /// **'No pudimos obtener información del producto'**
  String get cant_load_product_title;

  /// No description provided for @users_title.
  ///
  /// In es, this message translates to:
  /// **'Usuarios'**
  String get users_title;

  /// No description provided for @users_count_text.
  ///
  /// In es, this message translates to:
  /// **'El número total de usuarios es'**
  String get users_count_text;

  /// No description provided for @ok_label.
  ///
  /// In es, this message translates to:
  /// **'Ok'**
  String get ok_label;

  /// No description provided for @cant_load_users_title.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar los usuarios'**
  String get cant_load_users_title;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
