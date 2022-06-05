import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tiempo/Utils/utils.dart';
import 'package:test_tiempo/blocs/language/language_bloc.dart';
import 'package:test_tiempo/blocs/language/language_event.dart';
import 'package:test_tiempo/blocs/weather/weather_bloc.dart';
import 'package:test_tiempo/blocs/weather/weather_event.dart';
import 'package:test_tiempo/blocs/weather/weather_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_tiempo/ui/screens/form/form_screen.dart';
import 'package:test_tiempo/ui/screens/weather/widgets/weather_avatar.dart';
import 'package:test_tiempo/ui/screens/weather/widgets/weather_desctiption.dart';
import 'package:test_tiempo/ui/screens/weather/widgets/weather_row.dart';
import 'package:test_tiempo/ui/widgets/button_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  void pushToForm(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FormScreen(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state){
                  if (state is WeatherInitialState){
                    return const SizedBox();
                  }
                  else if (state is WeatherLoadingState){
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFA891FF),
                      ),
                    );
                  }
                  else if (state is WeatherLoadedState){
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20,),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Utils().getCityByCitiesEnum(
                                      citiesEnum: state.weatherCity,
                                      context: context
                                    ),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                )
                              ),
                              const SizedBox(height: 20,),
                              WeatherAvatar(
                                radius: MediaQuery.of(context).size.width / 6,
                                backgroundColor: const Color(0xFFEDE9FF),
                                assetPicture: state.weatherData.weatherDays[state.pickedDay].weatherUiState.icon,
                              ),
                              WeatherDescription(
                                title: state.weatherData.weatherDays[state.pickedDay].weatherUiState.name,
                                temperatureMax: state.weatherData.weatherDays[state.pickedDay].temperatureMax,
                                temperatureMin: state.weatherData.weatherDays[state.pickedDay].temperatureMin,
                                fontSize: 27,
                              ),
                              for (int i = 0; i < state.weatherData.weatherDays.length; i++)
                                WeatherRow(
                                  active: (i == state.pickedDay),
                                  assetPicture: state.weatherData.weatherDays[i].weatherUiState.icon,
                                  dateTime: state.weatherData.weatherDays[i].dateTime,
                                  temperatureMax: state.weatherData.weatherDays[i].temperatureMax,
                                  temperatureMin: state.weatherData.weatherDays[i].temperatureMin,
                                  onTap: (){
                                    BlocProvider.of<WeatherBloc>(context).add(
                                      ChangeWeatherDay(
                                        state.weatherCity,
                                        state.weatherData,
                                        i
                                      )
                                    );
                                  },
                                ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 5,
                              ),

                            ],
                          )
                        ],
                      )
                    );
                  }
                  else if (state is WeatherErrorState){
                    return const Center(
                      child: Text("Application error"),
                    );
                  }
                  else{
                    return const SizedBox();
                  }
                },
              ),

              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state){

                  CitiesEnum city = CitiesEnum.london;
                  int pickedDay = 0;

                  if (state is WeatherInitialState){
                    city = state.weatherCity;
                    pickedDay = state.pickedDay;
                  }
                  else if (state is WeatherLoadingState){
                    city = state.weatherCity;
                  }
                  else if (state is WeatherLoadedState){
                    city = state.weatherCity;
                    pickedDay = state.pickedDay;
                  }

                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 20,),
                              ButtonWidget(
                                width: (MediaQuery.of(context).size.width - 60) / 3,
                                height: 60,
                                content: AppLocalizations.of(context)!.toronto,
                                buttonState: (city == CitiesEnum.toronto) ?
                                  ButtonWidgetEnum.active : ButtonWidgetEnum.inactive,
                                onTap: (){
                                  BlocProvider.of<WeatherBloc>(context).add(
                                    LoadWeatherEvent(
                                      CitiesEnum.toronto,
                                      AppLocalizations.of(context)!.language,
                                      pickedDay
                                    )
                                  );
                                },
                              ),
                              const SizedBox(width: 10,),
                              ButtonWidget(
                                width: (MediaQuery.of(context).size.width - 60) / 3,
                                height: 60,
                                content: AppLocalizations.of(context)!.london,
                                buttonState: (city == CitiesEnum.london) ?
                                  ButtonWidgetEnum.active : ButtonWidgetEnum.inactive,
                                onTap: (){
                                  BlocProvider.of<WeatherBloc>(context).add(
                                    LoadWeatherEvent(
                                      CitiesEnum.london,
                                      AppLocalizations.of(context)!.language,
                                      pickedDay
                                    )
                                  );
                                },
                              ),
                              const SizedBox(width: 10,),
                              ButtonWidget(
                                width: (MediaQuery.of(context).size.width - 60) / 3,
                                height: 60,
                                content: AppLocalizations.of(context)!.singapore,
                                buttonState: (city == CitiesEnum.singapore) ?
                                  ButtonWidgetEnum.active : ButtonWidgetEnum.inactive,
                                onTap: (){
                                  BlocProvider.of<WeatherBloc>(context).add(
                                    LoadWeatherEvent(
                                      CitiesEnum.singapore,
                                      AppLocalizations.of(context)!.language,
                                      pickedDay
                                    )
                                  );
                                },
                              ),
                              const SizedBox(width: 20,),

                            ],
                          ),
                          SizedBox(height: 10,),
                          ButtonWidget(
                            width: (MediaQuery.of(context).size.width - 40),
                            height: 40,
                            content: AppLocalizations.of(context)!.form,
                            buttonState: ButtonWidgetEnum.inactive,
                            onTap: (){
                              // open new screen
                              pushToForm();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    LanguageEnum local = LanguageEnum.en;
                    if (AppLocalizations.of(context)!.language == 'en'){
                      local = LanguageEnum.es;
                    }

                    BlocProvider.of<LanguageBloc>(context).add(
                        LoadLanguageEvent(local)
                    );

                    CitiesEnum city = CitiesEnum.london;
                    WeatherState state = BlocProvider.of<WeatherBloc>(context).state;
                    int pickedDay = 0;

                    if (state is WeatherLoadingState){
                      city = state.weatherCity;
                    }else if (state is WeatherLoadedState){
                      city = state.weatherCity;
                      pickedDay = state.pickedDay;
                    }else if (state is WeatherInitialState){
                      city = state.weatherCity;
                      pickedDay = state.pickedDay;
                    }

                    BlocProvider.of<WeatherBloc>(context).add(
                      LoadWeatherEvent(
                        city,
                        Utils().getLocaleLanguage(languageEnum: local),
                        pickedDay
                      )
                    );
                  },
                  child: SizedBox(
                    width: 140,
                    height: 50,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(15), // Image radius
                              child: Image.asset(
                                (AppLocalizations.of(context)!.language == 'es') ?
                                'assets/images/espana.png' :
                                'assets/images/english.png',
                                fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(AppLocalizations.of(context)!.language,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
