import 'package:flutter/material.dart';
import 'package:flutter_solid/design_patterns/memento/command/command_history.dart';
import 'package:flutter_solid/design_patterns/memento/command/i_command.dart';
import 'package:flutter_solid/design_patterns/memento/command/randomize_command.dart';
import 'package:flutter_solid/design_patterns/memento/memento_state/originator.dart';
import 'package:flutter_solid/design_patterns/memento/view/shape_container.dart';

class MementoShapePageView extends StatefulWidget {
  const MementoShapePageView({Key? key}) : super(key: key);

  @override
  _ShapePageViewState createState() => _ShapePageViewState();
}

class _ShapePageViewState extends State<MementoShapePageView> {
  Editor editor = Editor();
  CommandHistory history = CommandHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memento'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _randomShape,
              child: Text('Criar shape'),
            ),
            ElevatedButton(
              onPressed: undoCommand,
              child: Text('Desfazer'),
            ),
            ElevatedButton(
              onPressed: redoCommand,
              child: Text('Refazer'),
            ),
            ShapeContainer(shape: editor.state)
          ],
        ),
      ),
    );
  }

  void _randomShape() {
    var command = RandomizeCommand(editor);
    executeCommand(command);
  }

  void executeCommand(ICommand command) {
    setState(() {
      command.execute();
      history.add(command);
    });
  }

  void undoCommand() {
    setState(() {
      history.undo();
    });
  }

  void redoCommand() {
    setState(() {
      history.redo();
    });
  }
}
