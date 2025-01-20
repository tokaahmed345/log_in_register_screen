import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logpage/cubits/cubit/log_cubit.dart';
import 'package:logpage/helper.dart';
import 'package:logpage/screens/login.dart';
import 'package:logpage/services.dart';
import 'package:logpage/widgets/custompass.dart';
import 'package:logpage/widgets/customtext.dart';

class Register extends StatefulWidget {
  static String id = 'register';

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> globalKey = GlobalKey();
  String? mail, user, phone, password;
  bool isvisiable = false;
  ServiseApi apiservice = ServiseApi();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogCubit(service: ServiseApi()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 20),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Register",
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
                      onChange: (value) {
                        user = value;
                      },
                      hint: "User Name",
                      icon: Icons.person),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onChange: (value) {
                      mail = value;
                    },
                    hint: "Email Address",
                    icon: Icons.mail,
                    validator: (value) {
                      return validation(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      keyboardType: TextInputType.phone,
                      onChange: (value) {
                        phone = value;
                      },
                      hint: "Phone",
                      icon: Icons.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextPassword(
                    validator: (value) => validation(value),
                    onChange: (value) => password = value,
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
                     Navigator.pushNamed(context, LogIn.id);

}else if(state is Failure){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errormessage)));

}
                      },
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () async {
                            if (globalKey.currentState!.validate()) {
                              BlocProvider.of<LogCubit>(context).register(
                                  name: user ?? "",
                                  phone: phone ?? "",
                                  email: mail ?? "",
                                  password: password ?? "");
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(20),
                          ),
                          child: const Text('Register'),
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
                      const Text("Already have an Account ?"),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/////////////////////////////////////////
  // Future<void> registervalidation(BuildContext context) async {
  //   if (globalKey.currentState!.validate()) {
  //     try {
  //       final registerResponse = await apiservice.registeruser(
  //         name: user ?? '',
  //         password: password ?? '',
  //         email: mail ?? '',
  //         phone: phone ?? '',
  //       );
  //       if (registerResponse.status == true) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text(" ${registerResponse.message}")));

  //         Navigator.pushNamed(context, LogIn.id);
  //       } else
  //         (ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text(" ${registerResponse.message}"))));
  //     } catch (e) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(" ${e.toString()}")));

  //       throw Exception(e.toString());
  //     }
  //   }
  // }
}
