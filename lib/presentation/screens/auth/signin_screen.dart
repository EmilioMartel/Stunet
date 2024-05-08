import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  static const String name = 'signin-screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late PageController _pageController;
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPublic = false;
  TextEditingController birthdayController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController statusController = TextEditingController();

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
    String surname = nameController.text;
    String email = emailController.text;
    

    if (email.isNotEmpty && !email.endsWith('@alu.ulpgc.es')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid @alu.ulpgc.es email')),
      );
      return false;
    }

    if(name.isEmpty || surname.isEmpty || email.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all inputs')),
      );
      return false;
    }

    return true;
    
  }

  bool _validateSecondPage() {
    if (birthdayController.text.isEmpty ||
        schoolController.text.isEmpty ||
        gradeController.text.isEmpty ||
        statusController.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all inputs')),
        );
        return false;
    }
    return true;
  }

  bool _validateThirdPage() {
    return passwordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text &&
        passwordController.text.length >= 6;
        
  }

  void previousPage() {
    _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
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
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: surnameController,
            decoration: const InputDecoration(labelText: 'Surname'),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: (){
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
            decoration: const InputDecoration(labelText: 'Birthday'),
          ),
          TextField(
            controller: schoolController,
            decoration: const InputDecoration(labelText: 'School'),
          ),
          TextField(
            controller: gradeController,
            decoration: const InputDecoration(labelText: 'Grade'),
          ),
          TextField(
            controller: statusController,
            decoration: const InputDecoration(labelText: 'Status (Single, Couple, IDK)'),
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

  TextEditingController confirmPasswordController = TextEditingController();

  Widget _buildThirdPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          TextField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
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
                    GoRouter.of(context).go('/home');
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
