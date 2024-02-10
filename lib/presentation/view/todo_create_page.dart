import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_list_side_project2/presentation/viewmodel/todo_create_viewmodel.dart';
import 'widget/todo_importance_widget.dart';

class TodoCreatePage extends ConsumerStatefulWidget {
  const TodoCreatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoCreatePageState();
}

class _TodoCreatePageState extends ConsumerState<TodoCreatePage> {
  late final TodoCreateViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(todoCreateViewModelProvider(null));
    _viewModel.setImportance('none');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildActionRow(context),
              _buildFormWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(Icons.close, () => Navigator.pop(context)),
        const Spacer(),
        _buildIconButton(
          Icons.save,
          _viewModel.isEnteredContent() ? () => _submitForm(context) : null,
          enabledColor: Colors.black,
          disabledColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback? onPressed,
      {Color? enabledColor, Color? disabledColor}) {
    return IconButton(
      icon: Icon(icon, size: 24),
      color: onPressed != null
          ? enabledColor ?? Colors.black
          : disabledColor ?? Colors.grey,
      onPressed: onPressed,
    );
  }

  void _submitForm(BuildContext context) {
    final currentState = _formKey.currentState;
    if (currentState != null && currentState.validate()) {
      _viewModel.createTodo();
      Navigator.pop(context);
    }
  }

  Widget _buildFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextField(
            onChanged: _viewModel.setTitle,
            decoration: const InputDecoration(labelText: 'Content'),
          ),
          const SizedBox(height: 16),
          TodoImportanceWidget(
            onSelectionChanged: (selection) =>
                _viewModel.setImportance(selection.toString().split('.').last),
          ),
        ],
      ),
    );
  }
}
