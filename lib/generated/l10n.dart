// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Lost in government paperwork?`
  String get onboardingTitle1 {
    return Intl.message(
      'Lost in government paperwork?',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Awraq brings all your documents and services together — clear, organized, and always at hand.`
  String get onboardingDescription1 {
    return Intl.message(
      'Awraq brings all your documents and services together — clear, organized, and always at hand.',
      name: 'onboardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Know exactly what to do`
  String get onboardingTitle2 {
    return Intl.message(
      'Know exactly what to do',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Step-by-step guidance with required documents, fees, office locations, and processing times.`
  String get onboardingDescription2 {
    return Intl.message(
      'Step-by-step guidance with required documents, fees, office locations, and processing times.',
      name: 'onboardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Complete any procedure easily`
  String get onboardingTitle3 {
    return Intl.message(
      'Complete any procedure easily',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Your AI-powered guide to government services — ask anything, get clear answers, finish faster.`
  String get onboardingDescription3 {
    return Intl.message(
      'Your AI-powered guide to government services — ask anything, get clear answers, finish faster.',
      name: 'onboardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
