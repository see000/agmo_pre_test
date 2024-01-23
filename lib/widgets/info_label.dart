import 'package:flutter/material.dart';

Widget InfoLabel({required String label, required Icon infoLabelIcon}){
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: infoLabelIcon),
      const SizedBox(width: 5,),
      Expanded(
        flex: 9,
        child: Text(
          label,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 12,
            
            fontWeight: FontWeight.bold,
            
            color: Colors.grey
          ),
        ),
      ),
    ],
  );
}