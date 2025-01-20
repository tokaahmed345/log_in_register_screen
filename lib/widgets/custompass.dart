import 'package:flutter/material.dart';

class CustomTextPassword extends StatefulWidget {
  const CustomTextPassword({super.key, this.validator, this.onChange, this.keyboardType});
final  String? Function(String?)? validator;
final  Function(String)? onChange;
final TextInputType? keyboardType;

  @override
  State<CustomTextPassword> createState() => _CustomTextPasswordState();
}

class _CustomTextPasswordState extends State<CustomTextPassword> {
  bool isvisiable=false;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
                keyboardType: TextInputType.number,
                onChanged:widget.onChange ,
                validator: widget.validator ,
                obscureText: !isvisiable, 
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isvisiable = !isvisiable;
                          });
                        },
                        icon: isvisiable
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              )
                            : const Icon(Icons.visibility_off)),
                    hintText: 'password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              );
  }
}