import 'package:ccr_checklist/store/config_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _diverNameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final configStore = Provider.of<ConfigStore>(context);
    _diverNameController.text = configStore.configData['DiverName'] ?? '';
  }

  @override
  void dispose() {
    _diverNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final configStore = Provider.of<ConfigStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _diverNameController,
              decoration: const InputDecoration(
                labelText: 'Diver Name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (newValue) {
                configStore.setDiverName(newValue);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                configStore.setDiverName(_diverNameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings saved')),
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
