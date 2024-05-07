import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {

  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox( width: 5 ),
              Text(title, style: titleStyle,),

              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.person))
            ],
          )
        ),
        
      )
    );
  }
}