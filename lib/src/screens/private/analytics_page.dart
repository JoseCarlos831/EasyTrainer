// lib/src/screens/private/analytics_page.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:personalapp/l10n/app_localizations.dart';


class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      setState(() {
        _selectedFile = File(result.path);
      });
    }
  }

  Future<void> _openCamera() async {
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      setState(() {
        _selectedFile = File(result.path);
      });
    }
  }

  void _continue() {
    final local = AppLocalizations.of(context)!;
    if (_selectedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(local.analyticsPage_successSnackbar)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.analyticsPage_title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                local.analyticsPage_description,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 24),

              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1732),
                    border: Border.all(color: Colors.tealAccent),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child:
                        _selectedFile != null
                            ? Text(
                              "${local.analyticsPage_filePrefix} ${_selectedFile!.path.split('/').last}",
                              style: const TextStyle(color: Colors.white70),
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.cloud_upload,
                                  color: Colors.tealAccent,
                                  size: 36,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  local.analyticsPage_selectFileLabel,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Center(
                child: Text(
                  local.analyticsPage_orSeparator,
                  style: const TextStyle(color: Colors.white38),
                ),
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF29243B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _openCamera,
                  icon: const Icon(Icons.photo_camera, color: Colors.white),
                  label: Text(
                    local.analyticsPage_openCameraButton,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _selectedFile != null ? _continue : null,
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.tealAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    local.analyticsPage_continueButton,
                    style: const TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
