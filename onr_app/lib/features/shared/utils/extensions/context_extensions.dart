import 'package:flutter/material.dart';
import 'package:onr_app/core/l10n/onr_localizations.dart'; 

extension BuildContextExt on BuildContext {

  ThemeData get theme => Theme.of(this);

  AppLocalizations get l10n => AppLocalizations.of(this)!;

}
