// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:ccrchecklist/store/config_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  final TextEditingController _diverNameController = TextEditingController();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final configStore = Provider.of<ConfigStore>(context);

    // Initialize the text controller with the current diver name
    _diverNameController.text = configStore.configData['DiverName'] ?? '';
    _diverNameController.addListener(() {
      configStore.setDiverName(_diverNameController.text);
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          actions: <Widget>[
            Observer(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.save),
                onPressed: configStore.isModified
                    ? () => configStore.saveConfig()
                    : null,
              );
            }),
          ],
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
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
