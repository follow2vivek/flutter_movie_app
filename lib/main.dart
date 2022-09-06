import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/movie/movie_bloc.dart';
import 'presentation/view/page/main_screen.dart';
import './di/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(
    BlocProvider(
      create: (_) => di.locator<MovieBloc>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Movie App",
        home: MainScreen(),
      ),
    ),
  );
}
