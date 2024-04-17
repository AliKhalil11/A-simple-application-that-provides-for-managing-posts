// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/core/App_theme.dart';
import 'package:getx_project/features/Posts/presentation/bloc/add_update_delete/add_delete_update_dart_bloc.dart';
import 'package:getx_project/features/Posts/presentation/bloc/bloc/posts_bloc.dart';
import 'package:getx_project/features/Posts/presentation/injection.dart'as di;
import 'features/Posts/presentation/pages/Posts_Page.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_)=>di.sl<AddDeleteUpdateDartBloc>()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Posts App',
        home:const PostsPages(),
         
      ),
    );
  }
}
