# Test de Orientación Vocacional - App Móvil

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge)

Aplicación móvil de un test de orientación vocacional, desarrollada en Flutter y utilizando GetX para la gestión de estado, rutas y dependencias.

## Acerca del Proyecto

Este proyecto nace como una solución para mejorar la experiencia de los aspirantes a la **Universidad Nacional de Loja (UNL)** que utilizan la herramienta web de orientación vocacional (Test CHASIDE). Tras analizar el uso de la plataforma existente, se identificó que un alto porcentaje de los estudiantes acceden desde dispositivos móviles, donde la experiencia no es óptima.

Esta aplicación resuelve dicha problemática ofreciendo una interfaz nativa, fluida y diseñada específicamente para smartphones, con el objetivo de hacer el proceso más accesible, intuitivo y eficaz.

## Características

- **📱 Interfaz Adaptativa:** Diseño pensado para una experiencia móvil nativa.
- **🚀 Gestión de Estado con GetX:** Arquitectura reactiva, rápida y eficiente.
- **🌐 Soporte Multi-idioma:** Inglés y Español, fácilmente extensible.
- **🎨 Tema Claro y Oscuro:** Adaptación visual según las preferencias del usuario.
- **🗺️ Navegación por Rutas Nombradas:** Código de navegación limpio y desacoplado.
- **📤 Consumo de API REST:** Desacopla la lógica de los datos a través de un servicio.
- **🧪 Pruebas de Widget:** Incluye pruebas unitarias para garantizar la calidad de la UI.

## Arquitectura del Proyecto

La aplicación sigue una arquitectura limpia, separando las responsabilidades en las siguientes capas:

- **/lib**
  - **/controllers:** Lógica de negocio y manejo de estado (`TestController`, `LangController`).
  - **/models:** Clases que definen la estructura de los datos (`Question`, `Career`, etc.).
  - **/routes:** Definición de las rutas nombradas de la aplicación.
  - **/services:** Comunicación con servicios externos (`ApiService`).
  - **/utils:** Utilidades reusables (`AppColors`, `AppTranslation`).
  - **/views:** La capa de UI, contiene las pantallas de la aplicación.
  - **main.dart:** Punto de entrada y configuración inicial.

## Cómo Empezar

Sigue estos pasos para ejecutar el proyecto en tu máquina local.

### Prerrequisitos

- Tener Flutter SDK instalado (versión 3.x o superior).
- Un emulador de Android o un dispositivo físico.

### Instalación

1.  **Clona el repositorio:**
    ```bash
    git clone [https://github.com/EdgarPatricio/test-vocacional-flutter.git](https://github.com/EdgarPatricio/test-vocacional-flutter.git)
    ```

2.  **Navega a la carpeta del proyecto:**
    ```bash
    cd test-vocacional-flutter
    ```

3.  **Instala las dependencias:**
    ```bash
    flutter pub get
    ```

4.  **Configura la API de Prueba:**
    Este proyecto utiliza una API de prueba (mock API).
    - Ve a [Beeceptor.com](https://beeceptor.com/) y crea un nuevo endpoint.
    - Crea las rutas `GET /questions` y `POST /results` con los JSON correspondientes.
    - Copia tu nueva URL base y pégala en el archivo `lib/services/api_service.dart`, en la variable `_baseUrl`.

5.  **Ejecuta la aplicación:**
    ```bash
    flutter run
    ```

## Pruebas

Para ejecutar las pruebas de widget incluidas en el proyecto, utiliza el siguiente comando:

```bash
flutter test
```

Desarrollado por Edgar Patricio Sánchez Malla - Proyecto final del curso de APLICACIONES MÓVILES ROBUSTAS CON FLUTTER E IA.

