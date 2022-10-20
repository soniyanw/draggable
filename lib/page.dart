import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  List<Widget> widgets = [];
  @override
  Widget build(BuildContext context) {
    Widget value = widgets.length == 0
        ? Center(
            child: Text("Workspace as Row"),
          )
        : ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int index) {
              return widgets[index];
            });

    return Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          title: Text("Draggable"),
        ),
        body: DragTarget(
          builder: (BuildContext context, List<dynamic> accepted,
              List<dynamic> rejected) {
            return value;
          },
          onAccept: (Widget widget) {
            setState(() {
              widgets += [widget];
            });
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Draggable(
                      data: Icon(Icons.insert_emoticon),
                      child: Icon(Icons.insert_emoticon),
                      feedback: Icon(
                        Icons.insert_emoticon,
                        size: 60,
                      ),
                      childWhenDragging:
                          Icon(Icons.check_box_outline_blank_outlined)),
                  Draggable(
                      data: Slider(
                        inactiveColor: Color(0xFF9E9E9E),
                        min: 0,
                        max: 10,
                        value: 0,
                        onChanged: (newValue) {},
                      ),
                      child: Icon(Icons.linear_scale_rounded),
                      feedback: Icon(
                        Icons.linear_scale_rounded,
                        size: 60,
                      ),
                      childWhenDragging: Icon(Icons.linear_scale_rounded)),
                  Draggable(
                      data: SwitchListTile(
                        value: true,
                        onChanged: (newValue) {},
                        title: Text(
                          'Title',
                        ),
                        subtitle: Text(
                          'Subtitle',
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      child: Icon(Icons.toggle_off_outlined),
                      feedback: Icon(
                        Icons.toggle_off_outlined,
                        size: 60,
                      ),
                      childWhenDragging: Icon(Icons.toggle_off_outlined)),
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        print(widgets.length);
                        widgets.removeAt(widgets.length - 1);
                        print(widgets.length);
                        setState(() {});
                      }),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Draggable(
                      data: MaterialButton(
                        onPressed: () {},
                        color: Colors.purple[100],
                        child: Text("Button"),
                      ),
                      child: Icon(Icons.smart_button),
                      feedback: Icon(
                        Icons.smart_button,
                        size: 60,
                      ),
                      childWhenDragging: Icon(Icons.smart_button)),
                  Draggable(
                      data: Center(child: Text("New Text")),
                      child: Icon(Icons.text_format_outlined),
                      feedback: Icon(
                        Icons.text_format_outlined,
                        size: 60,
                      ),
                      childWhenDragging: Icon(Icons.text_format_outlined)),
                  Draggable(
                      data: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(),
                      ),
                      child: Icon(Icons.text_fields),
                      feedback: Icon(
                        Icons.text_fields,
                        size: 60,
                      ),
                      childWhenDragging: Icon(Icons.text_fields)),
                  Draggable(
                      data: Divider(
                        thickness: 2,
                      ),
                      child: Icon(Icons.linear_scale),
                      feedback: Icon(
                        Icons.linear_scale,
                        size: 60,
                      ),
                      childWhenDragging: Icon(Icons.linear_scale)),
                ],
              ),
            ],
          ),
        ));
  }
}
