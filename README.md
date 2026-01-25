# Flutter Riverpod MVVM Template

![GitHub stars](https://img.shields.io/github/stars/santorasu/flutter-riverpod-mvvm-template?style=social)
![GitHub forks](https://img.shields.io/github/forks/santorasu/flutter-riverpod-mvvm-template?style=social)
![GitHub license](https://img.shields.io/github/license/santorasu/flutter-riverpod-mvvm-template)

A production-ready Flutter template with **Riverpod** state management and **MVVM** architecture pattern. Start new projects quickly with a well-organized, scalable codebase.

## ✨ Features

- 🏗️ **MVVM Architecture** - Clean separation of concerns
- 🔄 **Riverpod 3.x** - Modern state management with Notifier pattern
- 🎨 **Theming System** - Centralized colors, fonts, and styles
- 🧭 **Named Routing** - Organized navigation with route configuration
- 💾 **SharedPreferences** - Local storage utilities
- 📱 **Responsive Design** - flutter_screenutil integration
- 🌐 **API Client** - Dio-based networking with error handling

## 📁 Project Structure

```
lib/
├── core/
│   ├── constansts/          # Colors, images, icons
│   ├── network/             # API client, endpoints, error handling
│   ├── resource/            # Themes, fonts, styles, strings
│   └── route/               # Route names and configuration
├── data/
│   ├── models/              # Data models with fromJson/toJson
│   ├── repositories/        # Repository pattern implementation
│   └── sources/
│       ├── local/           # SharedPreferences utilities
│       └── remote/          # API services
├── presentation/
│   ├── auth/                # Sign in/Sign up screens
│   ├── bottom_nav/          # Bottom navigation with provider
│   ├── home/                # Home screen
│   ├── search/              # Search screen
│   ├── favorites/           # Favorites screen
│   ├── profile/             # Profile screen
│   ├── splash/              # Splash screen with animations
│   └── user/                # User list example
└── main.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK 3.0 or higher

### Installation

1. **Clone** the repository:
   ```bash
   git clone https://github.com/santorasu/flutter-riverpod-mvvm-template.git
   cd flutter-riverpod-mvvm-template
   ```

2. **Install** dependencies:
   ```bash
   flutter pub get
   ```

3. **Run** the app:
   ```bash
   flutter run
   ```

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| flutter_riverpod | ^3.0.3 | State management |
| dio | ^5.9.0 | HTTP client |
| shared_preferences | ^2.5.3 | Local storage |
| flutter_screenutil | ^5.9.3 | Responsive UI |
| fluttertoast | ^9.0.0 | Toast messages |
| image_picker | ^1.2.0 | Image selection |
| file_picker | ^10.3.3 | File selection |

## 🎯 Usage

### Creating a New Screen

1. Create view model in `presentation/feature/viewmodel/`:
   ```dart
   final myProvider = NotifierProvider<MyNotifier, MyState>(MyNotifier.new);

   class MyNotifier extends Notifier<MyState> {
     @override
     MyState build() => MyState.initial();
     
     void updateState() { ... }
   }
   ```

2. Create screen in `presentation/feature/view/`:
   ```dart
   class MyScreen extends ConsumerWidget {
     @override
     Widget build(BuildContext context, WidgetRef ref) {
       final state = ref.watch(myProvider);
       // ...
     }
   }
   ```

3. Add route in `route_name.dart` and `route_config.dart`

### Customization

| File | Customize |
|------|-----------|
| `color_manger.dart` | Brand colors |
| `font_manager.dart` | Typography |
| `theme_manager.dart` | App-wide theme |
| `app_strings.dart` | Text content |
| `api_endpoints.dart` | API base URL |

## 🔧 Configuration

### API Setup

Update `api_endpoints.dart`:
```dart
class ApiEndpoints {
  static const String baseUrl = "https://your-api.com";
  // Add your endpoints...
}
```

### Theme Colors

Update `color_manger.dart`:
```dart
static const Color primary = Color(0xFFYOUR_COLOR);
```

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👤 Author

**Rasu**
- GitHub: [@santorasu](https://github.com/santorasu)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

⭐ Star this repo if you find it helpful!
