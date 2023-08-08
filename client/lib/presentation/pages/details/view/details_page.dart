import 'package:collection/collection.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_gprc/di/di.dart';
import 'package:notes_gprc/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:notes_gprc/l10n/l10n.dart';
import 'package:notes_gprc/presentation/pages/details/widgets/add_note_button.dart';
import 'package:notes_gprc/presentation/presentation.dart';

/// {@template details_page}
/// Page to display the details of a note.
/// {@endtemplate}
class DetailsPage extends StatefulWidget {
  /// {@macro details_page}
  /// creates a [DetailsPage] instance.
  const DetailsPage({Key? key, this.noteId = 'create'}) : super(key: key);

  /// {@macro note_id}
  /// The id of the note to display.
  final String noteId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  /// The localization instance.
  AppLocalizations get l10n => AppLocalizations.of(context);

  /// The title of the app bar.
  String get appBarTitle => widget.noteId == 'create' ? l10n.create : l10n.edit;

  ///note bloc, since its instance is provided in main, we can use it directly.
  NotesBloc get _noteBloc => context.read();

  NoteEntity? get _note => _noteBloc.state.notes
      .firstWhereOrNull((element) => element.id == widget.noteId);

  /// {@macro note_form_cubit}
  /// The cubit to handle the form.
  late final NoteFormCubit _noteFormCubit;

  @override
  initState() {
    super.initState();
    _noteFormCubit = getIt()..initialize(_note);
  }

  @override
  dispose() {
    _noteFormCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _noteFormCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<NoteFormCubit, NoteFormState>(
            listenWhen: (prev, curr) => prev.status != curr.status,
            listener: (context, state) {
              switch (state.status) {
                case FormzSubmissionStatus.inProgress:
                  break;
                case FormzSubmissionStatus.success:
                  context.go('/');
                  break;
                case FormzSubmissionStatus.failure:
                  break;
                default:
              }
            },
          )
        ],
        child: PlatformScaffold(
          appBar: PlatformAppBar(
            title: Text(appBarTitle),
          ),
          body: const Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: NoteBody(),
                    ),
                    SliverToBoxAdapter(
                      child: NoteColor(),
                    ),
                    SliverToBoxAdapter(
                      child: TodoList(),
                    ),
                    SliverToBoxAdapter(
                      child: AddTodoTile(),
                    ),
                  ],
                ),
              ),
              AddNoteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
