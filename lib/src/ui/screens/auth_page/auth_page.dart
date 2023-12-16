import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_weather_application/src/common/theme/font_theme.dart';
import 'package:open_weather_application/src/ui/screens/weather_page/weather_page.dart';

import '../../../common.dart';
import '../../../core.dart';
import '../../../core/locators/service_locator.dart';
import 'bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthBloc _bloc = AuthBloc(getIt());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const WeatherPage()));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 48.h,
                    ),
                    Text(
                      "Вход",
                      style: FontTheme.h1.style(color: AppColors.blackText),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Введите данные для входа",
                      style: FontTheme.b2.style(color: AppColors.greyText),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        cursorColor: AppColors.error,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email',
                        )),
                    SizedBox(
                      height: 16.h,
                    ),
                    TextFormField(
                      obscureText: obscureText,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      cursorColor: AppColors.error,
                      decoration: InputDecoration(
                          labelText: "Пароль",
                          hintText: "Пароль",
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() {
                              obscureText = !obscureText;
                            }),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 9, end: 9, bottom: 9),
                              child: SvgPicture.asset(Helper.getSvgPath(
                                  obscureText
                                      ? "show_password.svg"
                                      : "hide_password.svg")),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _bloc.add(AuthUserEvent(
                                email: _emailController.text,
                                password: _passwordController.text));
                          }
                        },
                        child: Text(
                          "Войти",
                          style: FontTheme.b1Medium.style(),
                        )),
                    SizedBox(height: 24.h,),
                    if(state is AuthLoading)
                    const Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
