  String? validation(String? value) {
          if (value == null || value.isEmpty) {
      return 'field is required';
    }
    return null;
  }

