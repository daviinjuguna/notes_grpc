import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_gprc/core/app_colors.dart';
import 'package:notes_gprc/di/di.dart';
import 'package:notes_gprc/domain/domain.dart';
import 'package:notes_gprc/l10n/l10n.dart';
import 'package:notes_gprc/presentation/presentation.dart';

/// {@template home_page}
/// Page to display the list of notes.
/// {@endtemplate}
class HomePage extends StatefulWidget {
  /// {@macro home_page}
  /// creates a [HomePage] instance.
  /// {@endtemplate}
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppLocalizations get l10n => AppLocalizations.of(context);
  NotesBloc get _notesBloc => context.read();
  late final NoteActorCubit _noteActorCubit;

  //models
  List<NoteEntity> _notes = [];

  @override
  void initState() {
    super.initState();
    _notesBloc.add(NotesEventStarted());
    _noteActorCubit = getIt();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _addNote() => context.go('/details/create');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _notesBloc),

        //new instance we create
        BlocProvider(create: (_) => _noteActorCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<NotesBloc, NotesState>(
            listener: (context, state) {
              switch (state.status) {
                case NotesStatus.success:
                  _notes = state.notes;
                  break;

                default:
              }
            },
          ),
          BlocListener<NoteActorCubit, NoteActorState>(
            listener: (context, state) {
              switch (state) {
                case NoteActorState.success:
                  break;
                case NoteActorState.failure:
                  break;
                default:
              }
            },
            child: Container(),
          )
        ],
        child: PlatformScaffold(
          appBar: PlatformAppBar(
            title: Text(l10n.title),
          ),
          body: BlocBuilder<NotesBloc, NotesState>(
            builder: (context, state) {
              if (state.status == NotesStatus.loading && _notes.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (_notes.isEmpty && state.status == NotesStatus.success) {
                return Center(
                  child: PlatformElevatedButton(
                    onPressed: _addNote,
                    child: Text(l10n.addNote),
                  ),
                );
              }
              if (_notes.isEmpty && state.status == NotesStatus.failure) {
                return PlatformElevatedButton(
                  onPressed: () {
                    _notesBloc.add(NotesEventStarted());
                  },
                  child: Text(l10n.retry),
                  material: (context, platform) {
                    return MaterialElevatedButtonData(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.onError,
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  },
                  cupertino: (context, platform) {
                    return CupertinoElevatedButtonData(
                        color: CupertinoDynamicColor.withBrightness(
                      color: AppColors.light.error,
                      darkColor: AppColors.dark.error,
                    ));
                  },
                );
              }
              return ListView(
                padding: const EdgeInsets.all(5),
                children: [
                  ..._notes.map(
                    (note) => NoteCard(
                      note: note,
                      onTap: () {
                        context.go('/details/${note.id}');
                      },
                      onDelete: () async {
                        final delete = await showPlatformDialog<bool>(
                          context: context,
                          builder: (context) {
                            return PlatformAlertDialog(
                              title: Text(l10n.delete),
                              content: Text(l10n.confirmDelete),
                              actions: [
                                PlatformDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text(l10n.cancel),
                                ),
                                PlatformDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text(l10n.delete),
                                ),
                              ],
                            );
                          },
                        );
                        if (!mounted) return;
                        if (delete ?? false) {
                          _noteActorCubit.delete(note);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: PlatformElevatedButton(
                      onPressed: _addNote,
                      child: Text(l10n.addNote),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
