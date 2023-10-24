import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/data_providers/session_data_provider.dart';
import 'package:flutter_application_main1/ui/navigation/main_navigation.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';

class AuthWidgetModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Введите пароль и логин';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          _errorMessage = 'Cервер недоступен. Проверьте подключение к сети';
          break;
        case ApiClientExceptionType.auth:
          _errorMessage = 'Неверный логин или пароль';
          break;
        case ApiClientExceptionType.other:
          _errorMessage = 'Произошла неизвестная ошибка.Попробуйте позже';
          break;
      }
    } catch (e) {
      _errorMessage = 'Произошла ошибка.Попробуйте позже';
    }

    _isAuthProgress = false;
    if (errorMessage != null) {
      notifyListeners();
      return;
    }
    if (sessionId == null) {
      _errorMessage = 'Неизвестная ошибка ,повторите попытку';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen);
  }
}

// class AuthWidgetModelProvider extends InheritedNotifier {
//   final AuthWidgetModel model;

//   const AuthWidgetModelProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );

//   static AuthWidgetModelProvider? watch(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<AuthWidgetModelProvider>();
//   }

//   static AuthWidgetModelProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<AuthWidgetModelProvider>()
//         ?.widget;
//     0;
//     return widget is AuthWidgetModelProvider ? widget : null;
//   }
// }

// class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
//   final Model model;

//   const NotifierProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );

//   static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
//         ?.model;
//   }

//   static Model? read<Model extends ChangeNotifier>(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
//         ?.widget;
//     0;
//     return widget is NotifierProvider<Model> ? widget.model : null;
//   }
// }
