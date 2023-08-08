import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:notes_gprc/data/data.dart';
import 'package:notes_gprc/domain/domain.dart';
import 'package:notes_gprc/presentation/presentation.dart';
import 'package:protos/protos.dart';

final getIt = GetIt.asNewInstance();

FutureOr<void> configureDependencies() {
  //External
  final channel = ClientChannel(
    // 'localhost',
    '192.168.1.67',
    port: 4000,
    options: const ChannelOptions(
      connectTimeout: Duration(seconds: 60),
      connectionTimeout: Duration(seconds: 60),
      credentials: ChannelCredentials.insecure(
          // onBadCertificate: (certificate, host) => true,
          ),
    ),
  );
  final client = NoteServiceClient(channel);
  getIt.registerLazySingleton(() => client);

  //Data
  getIt.registerLazySingleton<NotesRepo>(() => NotesRepoImp(getIt()));

  //Domain
  getIt.registerLazySingleton(() => WatchNotesUseCase(getIt()));
  getIt.registerLazySingleton(() => CreateNoteUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateNoteUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteNoteUseCase(getIt()));

  getIt.registerLazySingleton(() => CreateTodoUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateTodoUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateTodosUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteTodoUseCase(getIt()));

  //bloc
  getIt.registerFactory(() => NotesBloc(getIt()));
  getIt.registerFactory(() => NoteFormCubit(getIt()));
  getIt.registerFactory(() => NoteActorCubit(getIt()));
}
