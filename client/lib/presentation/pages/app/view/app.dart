import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_gprc/di/di.dart';
import 'package:notes_gprc/presentation/presentation.dart';

///
/// {@template note_grpc_app}
/// The root widget of the application.
/// {@endtemplate}
class NoteGrpcApp extends StatelessWidget {

  /// {@macro note_grpc_app}
  /// creates a [NoteGrpcApp] instance.
  const NoteGrpcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NotesBloc>(),
        ),
      ],
      child: const AppView(),
    );
  }
}
