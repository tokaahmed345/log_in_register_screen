import 'package:flutter/material.dart';
import 'package:logpage/cubits/cubit/log_cubit.dart';
import 'package:logpage/helper.dart';
import 'package:logpage/screens/body.dart';
import 'package:logpage/screens/register.dart';
import 'package:logpage/services.dart';
import 'package:logpage/widgets/custompass.dart';
import 'package:logpage/widgets/customtext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatefulWidget {
  static String id = 'login';

  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  ServiseApi service = ServiseApi();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogCubit(service: ServiseApi()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("login now to browser our hot offers",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    validator: (value) {
                      return validation(value);
                    },
                    onChange: (value) {
email=value;
                    },
                    hint: "Email Address",
                    icon: Icons.mail),
                const SizedBox(
                  height: 20,
                ),
                CustomTextPassword(
                  validator: (value) => validation(value),
                  onChange: (value) => password=value,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: BlocConsumer<LogCubit, LogState>(
                    listener: (context, state) {
if(state is Success){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                     Navigator.pushNamed(context, Main.id);

}else if(state is Failure){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errormessage)));

}

                    },
                    builder: (context, state) {
                      if(state is LoginLoading){
                   return     Center(child: CircularProgressIndicator(color: Colors.blue));
                      }
                      return TextButton(
                        onPressed: () async {
                            if (formkey.currentState!.validate()) {
                            context.read<LogCubit>().login(email: email ?? "", password: password ?? "");
                          }
                        
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                        ),
                        child:  const Text('Login'),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Don't have an Account ?"),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Register.id);
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

////////////////
  // Future<void> validatelog(BuildContext context) async {
  //   if (formkey.currentState!.validate()) {
  //     setState(() {
  //       isloading = true;
  //     });
  //     try {
  //       final logresponse =
  //           await service.loguser(email: email ?? "", password: password ?? "");

  //       if (logresponse.status == true) {
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text(" ${logresponse.message}")));

  //         Navigator.pushNamed(context, Main.id);

  //         setState(() {
  //           isloading = false;
  //         });
  //       } else {
  //         setState(() {
  //           isloading = false;
  //         });
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text(" ${logresponse.message}")));
  //       }
  //     } catch (e) {
  //       setState(() {
  //         isloading = false;
  //       });
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(" ${e.toString()}")));
  //     }
  //   }
  }

