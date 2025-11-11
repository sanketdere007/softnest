import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double fieldFontSize;
    EdgeInsetsGeometry sectionPadding;
    double inputSpacing;

    if (screenWidth < 600) {
      fieldFontSize = 14;
      sectionPadding = EdgeInsets.all(16);
      inputSpacing = 12;
    } else if (screenWidth < 1024) {
      fieldFontSize = 16;
      sectionPadding = EdgeInsets.symmetric(horizontal: 32, vertical: 24);
      inputSpacing = 16;
    } else {
      fieldFontSize = 18;
      sectionPadding = EdgeInsets.symmetric(horizontal: 64, vertical: 32);
      inputSpacing = 20;
    }

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        padding: sectionPadding,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: fieldFontSize + 6,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF262262),
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: inputSpacing + 4),

              _buildTextField('Name', fieldFontSize, isRequired: true, icon: Icons.person),
              SizedBox(height: inputSpacing),

              _buildMobileField('Mobile Number', fieldFontSize),
              SizedBox(height: inputSpacing),

              _buildTextField('Email', fieldFontSize, keyboardType: TextInputType.emailAddress, isRequired: true, icon: Icons.email),
              SizedBox(height: inputSpacing),



              _buildTextField('Message', fieldFontSize, maxLines: 4, icon: Icons.message),
              SizedBox(height: inputSpacing + 4),

              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit form logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Message Sent!')),
                    );
                  }
                },
                icon: const Icon(Icons.send, color: Colors.white),
                label: Text(
                  'Send',
                  style: TextStyle(fontSize: fieldFontSize, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF262262),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 6,
                  shadowColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      double fontSize, {
        int maxLines = 1,
        TextInputType? keyboardType,
        bool isRequired = false,
        IconData? icon,
      }) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: fontSize,
            ),
            children: isRequired
                ? [TextSpan(text: ' *', style: TextStyle(color: Colors.red))]
                : [],
          ),
        ),
        prefixIcon: icon != null ? Icon(icon, color: Colors.blueGrey) : null,
        hintText: 'Enter $label',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
      style: TextStyle(fontSize: fontSize),
      validator: (value) {
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return '$label is required';
        }
        return null;
      },
    );
  }

  Widget _buildMobileField(String label, double fontSize) {
    return TextFormField(
      controller: _mobileController,
      maxLength: 10,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: '$label',
            style: TextStyle(color: Colors.grey[800], fontSize: fontSize),
            children: [
              TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        prefixIcon: Icon(Icons.phone, color: Colors.blueGrey),
        hintText: 'Enter $label',
        counterText: '', // hide character count
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
      style: TextStyle(fontSize: fontSize),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required';
        } else if (value.length != 10) {
          return 'Mobile number must be 10 digits';
        }
        return null;
      },
    );
  }
}
