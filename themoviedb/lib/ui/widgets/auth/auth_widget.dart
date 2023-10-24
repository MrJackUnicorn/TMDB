import 'package:flutter/material.dart';
import 'package:flutter_application_main1/ui/widgets/auth/auth_widget_model.dart';
import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';
import 'package:flutter_application_main1/ui/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FormWidget(),
          const SizedBox(
            height: 25,
          ),
          Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: textStyle,
          ),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text(
              'Register',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'If you signed up but didn`t get your verification email',
            style: textStyle,
          ),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: const Text('Verify email')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<AuthWidgetModel>(context);
    const borderDecorator = InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true,
        prefixIcon: Icon(Icons.person));
    const textStyle = TextStyle(fontSize: 16, color: Colors.black);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        const _ErrorMessgaeWidget(),
        const Text(
          'Username',
          style: textStyle,
        ),
        TextField(
          controller: model?.loginTextController,
          decoration: borderDecorator,
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Password',
          style: textStyle,
        ),
        TextField(
          controller: model?.passwordTextController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              isCollapsed: true,
              prefixIcon: Icon(Icons.password)),
          obscureText: true,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            const AuthButtonWidget(),
            const SizedBox(
              width: 25,
            ),
            TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: const Text(
                'Reset password',
              ),
            )
          ],
        ),
      ],
    );
  }
}

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthWidgetModel>(context);
    const color = Color(0xFF01B4E4);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            height: 10,
            width: 10,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
        : const Text('Login');
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: child,
    );
  }
}

class _ErrorMessgaeWidget extends StatelessWidget {
  const _ErrorMessgaeWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        NotifierProvider.watch<AuthWidgetModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}
