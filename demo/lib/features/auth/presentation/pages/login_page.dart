import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/core/ui/custom_text_field.dart';
import 'package:demo/features/app/presentation/pages/main_page.dart';
import 'package:demo/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:demo/features/auth/presentation/blocs/auth_event.dart';
import 'package:demo/features/auth/presentation/blocs/auth_state.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ShoeBloc(),
                child: MainPage(),
              ),
            ),
          );
        } else if (state is FailureAuthState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = state is LoadingAuthState;
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    AbsorbPointer(
                      absorbing: isLoading,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            icon: Icon(Icons.search),
                            hintText: "Search",
                            editingController: _username,
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            icon: Icon(Icons.lock),
                            hintText: "Password",
                            editingController: _password,
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: ColorPalette.primary,
                                foregroundColor: Colors.white,
                                side: BorderSide(color: ColorPalette.primary),
                              ),
                              onPressed: () => {
                                context.read<AuthBloc>().add(
                                  LoginEvent(
                                    username: _username.text,
                                    password: _password.text,
                                  ),
                                ),
                              },
                              child: Text("Sign in"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isLoading)
                      Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorPalette.primary,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
