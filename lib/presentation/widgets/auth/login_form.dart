import "package:auto_route/auto_route.dart";
import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/presentation/widgets/auth/input_field.dart";
import "package:flash_mail/presentation/widgets/primary_button.dart";
import "package:flash_mail/presentation/widgets/small_loading_spinner.dart";
import "package:flash_mail/shared/utils/regex_patterns.dart";

class LoginForm extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  LoginForm({super.key});

  String? _validateEmail(String? value) {
    if (value!.isEmpty || !emailRegex.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty || value.length < 8) {
      return "Password too short";
    }
    return null;
  }

  void showErrorSnackBar(BuildContext ctx, String message) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleSubmit(BuildContext context, WidgetRef ref) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    _formKey.currentState!.save();

    try {
      String? email = ref.read(emailProvider.notifier).state;
      String? password = ref.read(passwordProvider.notifier).state;

      await ref.read(accountProvider.notifier).login(email, password);

      if (context.mounted) {
        AutoRouter.of(context).replaceNamed("/inbox");
      }
    } on DioError catch (err) {
      if (context.mounted) {
        showErrorSnackBar(context, err.message);
      }
    } catch (_) {
      if (context.mounted) {
        showErrorSnackBar(context, "Something went wrong!");
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputField(
            label: "Email Address",
            placeholder: "Enter email",
            inputType: TextInputType.emailAddress,
            inputAction: TextInputAction.next,
            validator: _validateEmail,
            onSaved: (value) => ref.read(emailProvider.notifier).state = value,
          ),
          const SizedBox(height: 25),
          InputField(
            label: "Password",
            placeholder: "Enter password",
            obscureText: true,
            inputAction: TextInputAction.done,
            validator: _validatePassword,
            onSaved: (value) =>
                ref.read(passwordProvider.notifier).state = value,
          ),
          const SizedBox(height: 30),
          Center(
            child: PrimaryButton(
              onPressed: () => _handleSubmit(context, ref),
              child: account.isLoading
                  ? const SmallLoadingSpinner()
                  : const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
