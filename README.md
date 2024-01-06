# Simple News App

This is a simple Flutter application that fetches and displays news headlines using a news API.

## How to Run

### Prerequisites

- **Flutter SDK**: Make sure you have Flutter installed. You can download it from [here](https://flutter.dev/docs/get-started/install).

### Steps

1. **Clone the Repository**
    ```bash
    git clone https://github.com/Rahul99sh/Simple_News.git
    ```

2. **Navigate to Project Directory**
    ```bash
    cd simple_news_app
    ```

3. **Get Dependencies**
    ```bash
    flutter pub get
    ```

4. **Run the App**
    - **Using Flutter CLI**:
        ```bash
        flutter run
        ```
    - **Using IDEs**:
        Open the project in your preferred IDE (e.g., Android Studio, VSCode) and run the app from there.

5. **Launching on Specific Devices or Emulators**
    - To launch on a specific device/emulator, use:
        ```bash
        flutter devices
        ```
        This command lists available devices/emulators, and then you can run the app on a specific one:
        ```bash
        flutter run -d device_id
        ```

6. **Building Release APK/IPA**
    - For Android:
        ```bash
        flutter build apk
        ```
    - For iOS:
        ```bash
        flutter build ios
        ```

8. **Customization**
    - You might need to configure API keys or endpoints in `news_headlines_api.dart` according to your API provider's instructions.

Happy Coding!
