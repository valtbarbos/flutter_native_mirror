package br.com.alvertabbaros.flutter_native_mirror.handlers;
import android.os.Handler;
import android.os.Looper;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;

public class BetterEventChannel implements EventSink {
    private EventSink eventSink;

    public BetterEventChannel(final BinaryMessenger messenger, final String id) {
        EventChannel eventChannel = new EventChannel(messenger, id);
        eventChannel.setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(final Object arguments, final EventSink eventSink) {
                BetterEventChannel.this.eventSink = eventSink;
            }

            @Override
            public void onCancel(final Object arguments) {
                eventSink = null;
            }
        });
    }

        //TODO  https://github.com/flutter/flutter/issues/34993
//    private static class MainThreadEventSink implements EventSink {
//        private EventChannel.EventSink eventSink;
//        private Handler handler;
//
//        MainThreadEventSink(EventChannel.EventSink eventSink) {
//            this.eventSink = eventSink;
//            handler = new Handler(Looper.getMainLooper());
//        }
//
//        @Override
//        public void success(final Object o) {
//            handler.post(new Runnable() {
//                @Override
//                public void run() {
//                    eventSink.success(o);
//                }
//            });
//        }
//
//        @Override
//        public void error(final String s, final String s1, final Object o) {
//            handler.post(new Runnable() {
//                @Override
//                public void run() {
//                    eventSink.error(s, s1, o);
//                }
//            });
//        }
//
//        /**
//         * Consumes end of stream. Ensuing calls to {@link #success(Object)} or {@link #error(String,
//         * String, Object)}, if any, are ignored.
//         */
//        @Override
//        public void endOfStream() {
//
//        }
//    }

    @Override
    public void success(Object event) {
        if (eventSink != null) eventSink.success(event);
    }

    @Override
    public void error(String errorCode, String errorMessage, Object errorDetails) {
        if (eventSink != null) eventSink.error(errorCode, errorMessage, errorDetails);
    }

    @Override
    public void endOfStream() {
        if (eventSink != null) eventSink.endOfStream();
    }
}
