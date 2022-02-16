import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tasks/presentation/home_tasks_screen.dart';
import '../../../foundation/validators/validator.dart';
import 'cubits/login/login_cubit.dart';
import 'cubits/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                validator: Validator.requiredValidator,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: Validator.requiredValidator,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              BlocConsumer<LoginCubit, LoginState>(
                builder: (_, state) {
                  if (state is LoginFailure) {
                    Text('Usuário e/ou senha incorretos!');
                  }

                  if (state is LoginInProgress) {
                    return LinearProgressIndicator();
                  }

                  return Container();
                },
                listener: (_, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeTasksScreen(),
                      ),
                    );
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<LoginCubit>().authenticate(
                          username: _nameController.text,
                          password: _passwordController.text,
                        );
                  }
                },
                child: Text('authenticate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
