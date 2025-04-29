import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
    if (_selectedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("File uploaded successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Upload a file",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Regulations require you to upload a national identity card. Don't worry, your data will stay safe and private.",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 24),

              // File Selection Area
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
                    child: _selectedFile != null
                        ? Text(
                            "File: ${_selectedFile!.path.split('/').last}",
                            style: const TextStyle(color: Colors.white70),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.cloud_upload, color: Colors.tealAccent, size: 36),
                              SizedBox(height: 10),
                              Text("Select file", style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              const Center(child: Text("or", style: TextStyle(color: Colors.white38))),
              const SizedBox(height: 16),

              // Camera Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF29243B),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: _openCamera,
                  icon: const Icon(Icons.photo_camera, color: Colors.white),
                  label: const Text(
                    "Open Camera & Take Photo",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _selectedFile != null ? _continue : null,
                  style: ElevatedButton.styleFrom(

                    side: BorderSide(color: Colors.tealAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
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
