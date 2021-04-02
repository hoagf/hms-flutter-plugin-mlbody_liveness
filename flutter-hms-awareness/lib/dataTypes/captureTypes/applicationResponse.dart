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

import 'dart:convert' show json;
import 'package:huawei_awareness/constants/param.dart';

class ApplicationResponse {
  int applicationStatus;

  ApplicationResponse({
    this.applicationStatus,
  });

  factory ApplicationResponse.fromJson(String str) =>
      ApplicationResponse.fromMap(json.decode(str));

  factory ApplicationResponse.fromMap(Map<String, dynamic> jsonMap) =>
      ApplicationResponse(
        applicationStatus: jsonMap[Param.applicationStatus] == null
            ? null
            : jsonMap["applicationStatus"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        Param.applicationStatus:
            applicationStatus == null ? null : applicationStatus,
      };
}
