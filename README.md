# Weather App

Un app meteorológico

## Comentarios

Inicio  
 • Diseño hecho en Figma  
 • Hay tres ciudades en la pantalla de Inicio y puedes ver el clima durante 5 días  
 • También puede elegir español o Inglés  
Arquitectura  
Hemos separado UI (View) / Modelos (Model) y la lógica BLoC (ViewModel)  
 1 Ui: Tenemos la carpeta de pantallas (Para Paginas) y la carpeta de Widgets (para Widgets generales)  
 2 Modelos: Tenemos modelo de Weather, se definió toda la información importante.  
 3 BLoC: Tenemos Wheather/idioma y formulario BLoC:  
 • BLoC idioma esta inicializado en Main y usa Flutter_Localization para cambiar el idioma, tenemos 2 archivos para ambos idiomas (l10n/app_en.arb y l10n/app_es.arb)  
 • Los datos de Internet se toman a través de un repositorio especial (resources/repository.dart) y allí con cliente de API   (resources/service/weather_service.dart). Y para las solicitudes Https, estoy usando Dio  
