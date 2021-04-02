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

package com.huawei.hms.flutter.ar.view;

import static com.huawei.hms.flutter.ar.constants.ARSceneType.BODY;
import static com.huawei.hms.flutter.ar.constants.ARSceneType.FACE;
import static com.huawei.hms.flutter.ar.constants.ARSceneType.HAND;
import static com.huawei.hms.flutter.ar.constants.ARSceneType.WORLD;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import com.huawei.hms.flutter.ar.constants.ARSceneType;
import com.huawei.hms.flutter.ar.util.PermissionUtil;

import org.json.JSONException;
import org.json.JSONObject;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.JSONMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class ARSceneViewFactory extends PlatformViewFactory {
    private static final String TAG = ARSceneViewFactory.class.getSimpleName();
    private BinaryMessenger messenger;
    private Activity activity;

    public ARSceneViewFactory(BinaryMessenger messenger, Activity activity) {
        super(JSONMessageCodec.INSTANCE);
        this.messenger = messenger;
        this.activity = activity;
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        if (!PermissionUtil.hasPermission(activity)) {
            PermissionUtil.requestCameraPermission(activity);
        }
        JSONObject jsonSceneConfig;
        try {
            jsonSceneConfig = new JSONObject(args.toString());
            return new ARSceneView(getArSceneType(jsonSceneConfig.getString("type")), messenger, activity, viewId,
                jsonSceneConfig);
        } catch (JSONException e) {
            Log.d(TAG, "Error while creating the scene, unsupported scene type. Error: " + e.getMessage(),
                e.getCause());
        }
        return new ARSceneView(WORLD, messenger, activity, viewId, new JSONObject());
    }

    private ARSceneType getArSceneType(String arSceneType) {
        switch (arSceneType) {
            case "arHand":
                return HAND;
            case "arFace":
                return FACE;
            case "arBody":
                return BODY;
            default:
                return WORLD;
        }
    }
}
