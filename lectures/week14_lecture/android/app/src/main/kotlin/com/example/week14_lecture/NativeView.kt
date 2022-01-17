package com.example.week14_lecture

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

// Source: https://docs.flutter.dev/development/platform-integration/platform-views

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView by lazy {
        TextView(context).apply {
            textSize = 24f
            setTextColor(Color.GREEN)
            text = "Rendered on a native Android view (id: $id)"
        }
    }

    override fun getView(): View {
        return textView
    }

    override fun dispose() = Unit
}

class NativeViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return NativeView(context, viewId, creationParams)
    }
}
