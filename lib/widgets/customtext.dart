import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, required this.icon, this.validator, this.onChange, this.keyboardType});
final  String hint;
final IconData icon;
final  String? Function(String?)? validator;
final  Function(String)? onChange;
final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType ,
      validator:validator,
      onChanged:onChange,
      decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.grey,),
  hintText: hint,
  hintStyle: const TextStyle(color: Colors.grey),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
  )); 

  }
}