import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smash_import_export_plugins/generated/l10n.dart';
import 'package:smash_import_export_plugins/smash_import_export_plugins.dart';
import 'mock_project_db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMASH Import/Export Plugins Example',
      //  locale: Locale('ja', 'JP'),
      localizationsDelegates: [
        IEL.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: IEL.supportedLocales,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'SMASH Import/Export Plugins Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var db = MockProjectDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImportWidget(
                          projectDb: db,
                        )));
              },
              child: Text('Import')
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExportWidget(
                            projectDb: db,
                          )));
                },
                child: Text('Export')
            ),
          ],
        ),
      ),
    );
  }
}
