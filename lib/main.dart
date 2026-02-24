import 'package:character_almanach_mobile/l10n/app_localizations.dart';
import 'package:character_almanach_mobile/screens/home.dart';
import 'package:character_almanach_mobile/screens/root.dart';

import 'providers/sqlflite/database_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:redux/redux.dart';
import 'providers/redux_store.dart';
import 'providers/app_state/app_state.dart';
import 'providers/app_state/reducers/app_reducers.dart';
import 'widgets/error.dart';
import 'widgets/loader.dart';
import 'package:flutter/material.dart';

void main() async{
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  ReduxStoreManager().init(
    Store<AppState>(appReducer, initialState: AppState.initial()),
  );

  WidgetsFlutterBinding.ensureInitialized();
  runApp(CharacterAlmanach());
}

class CharacterAlmanach extends StatelessWidget {
  const CharacterAlmanach({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en'),
        Locale('it'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Character Almanach',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack(
        children: [
          Loader(),
          const ErrorDialog(),
          RootPage()
        ]
      ),
    );
  }
}
