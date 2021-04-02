/*
    Copyright 2020-2021. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String buttonText;
  final List<int> capabilityList;
  final int capabilityCode;
  final Function onPressed;

  CustomRaisedButton({
    this.buttonText,
    this.capabilityList,
    this.capabilityCode,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
            onPressed:
                capabilityList.contains(capabilityCode) ? onPressed : null),
      ),
    );
  }
}
