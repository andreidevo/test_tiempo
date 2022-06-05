import 'package:flutter/material.dart';
import 'package:test_tiempo/Utils/utils.dart';
import 'package:test_tiempo/blocs/form/form_bloc.dart';
import 'package:test_tiempo/blocs/language/language_bloc.dart';
import 'package:test_tiempo/blocs/weather/weather_bloc.dart';
import 'package:test_tiempo/blocs/weather/weather_event.dart';
import 'package:test_tiempo/resources/weather_repository.dart';
import 'package:test_tiempo/ui/screens/weather/weather_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => WeatherRepository(),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(
            RepositoryProvider.of<WeatherRepository>(context)
          )..add(const LoadWeatherEvent(CitiesEnum.london, 'en', 0))
        ),
        BlocProvider(
          create: (context) => FormBloc()
        ),
        BlocProvider(
          create: (context) => LanguageBloc(),
        )
      ],
      child: const MyApp()
    ))
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, Locale>(
      builder: (context, language){
        return MaterialApp(
          locale: language,
          supportedLocales: const [
            Locale('en', ''),
            Locale('es', ''),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: 'Weather',
          home: const WeatherScreen()
        );
      },
    );
  }
}
