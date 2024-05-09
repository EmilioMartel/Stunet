import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  static const String name = 'signin-screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late PageController _pageController;
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPublic = false;
  TextEditingController birthdayController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  bool nameError = false;
  bool surnameError = false;
  bool emailError = false;
  bool passwordError = false;
  bool confirmPasswordError = false;
  bool birthdayError = false;
  bool schoolError = false;
  bool gradeError = false;
  bool statusError = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_validateCurrentPage()) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  bool _validateCurrentPage() {
    switch (_pageController.page!.round()) {
      case 0:
        return _validateFirstPage();
      case 1:
        return _validateSecondPage();
      case 2:
        return _validateThirdPage();
      default:
        return false;
    }
  }

  bool _validateFirstPage() {
    String name = nameController.text;
    String surname = surnameController.text;
    String email = emailController.text;

    setState(() {
      nameError = name.isEmpty;
      surnameError = surname.isEmpty;
      emailError = email.isEmpty || !email.endsWith('@alu.ulpgc.es');
    });

    return !nameError && !surnameError && !emailError;
  }

  bool _validateSecondPage() {
    String birthday = birthdayController.text;
    String school = schoolController.text;
    String grade = gradeController.text;
    String status = statusController.text;

    setState(() {
      birthdayError = birthday.isEmpty;
      schoolError = school.isEmpty;
      gradeError = grade.isEmpty;
      statusError = status.isEmpty;
    });

    return !birthdayError && !schoolError && !gradeError && !statusError;
  }

  bool _validateThirdPage() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    setState(() {
      passwordError = password.isEmpty || password.length < 6;
      confirmPasswordError = confirmPassword.isEmpty || confirmPassword != password;
    });

    return !passwordError && !confirmPasswordError;
  }

  void previousPage() {
    _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        birthdayController.text = pickedDate.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildFirstPage(),
          _buildSecondPage(),
          _buildThirdPage(),
        ],
      ),
    );
  }

  Widget _buildFirstPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              errorText: nameError ? 'Please enter your name' : null,
            ),
          ),
          TextField(
            controller: surnameController,
            decoration: InputDecoration(
              labelText: 'Surname',
              errorText: surnameError ? 'Please enter your surname' : null,
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: emailError ? 'Please enter a valid @alu.ulpgc.es email' : null,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
                child: const Text('Go back'),
              ),
              ElevatedButton(
                onPressed: nextPage,
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecondPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CheckboxListTile(
            title: const Text("Make Account Public?"),
            value: isPublic,
            onChanged: (newValue) {
              setState(() {
                isPublic = newValue!;
              });
            },
          ),
          TextField(
            controller: birthdayController,
            decoration: InputDecoration(
              labelText: 'Birthday',
              errorText: birthdayError ? 'Please enter your birthday' : null,
            ),
            onTap: () {
              _selectDate(context);
            },
          ),
          TextField(
            controller: schoolController,
            decoration: InputDecoration(
              labelText: 'School',
              errorText: schoolError ? 'Please enter your school' : null,
            ),
          ),
          TextField(
            controller: gradeController,
            decoration: InputDecoration(
              labelText: 'Grade',
              errorText: gradeError ? 'Please enter your grade' : null,
            ),
          ),
          TextField(
            controller: statusController,
            decoration: InputDecoration(
              labelText: 'Status (Single, Couple, IDK)',
              errorText: statusError ? 'Please enter your status' : null,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: previousPage,
                child: const Text('Previous'),
              ),
              ElevatedButton(
                onPressed: nextPage,
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThirdPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: passwordError ? 'Please enter a password with at least 6 characters' : null,
            ),
          ),
          TextField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              errorText: confirmPasswordError ? 'Passwords do not match' : null,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: previousPage,
                child: const Text('Previous'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_validateCurrentPage()) {
                    GoRouter.of(context).go('/main');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields correctly')),
                    );
                  }
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
