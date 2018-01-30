# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#-dontwarn javax.annotation.**
#-dontwarn org.codehaus.mojo.animal_sniffer.**


#-dontwarn okio.**
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.ParametersAreNonnullByDefault
-dontwarn org.codehaus.mojo.animal_sniffer.*
#-dontwarn org.codehaus.mojo.**


# -dontshrink

#-keep class com.github.satoshun.droidkaigi2018.proguard.MainActivity {
#    *** oooooo(int);
#}

# クラス名、メンバーをキープ
# 使っていなくても指定があればキープ
#-keep class com.github.satoshun.droidkaigi2018.proguard.Hoge {
#    *;
#         android.view.View view2;
#}

# メンバーをキープ。クラス名は短縮
# 使っていない場合もキープ。
#-keepclassmembers class com.github.satoshun.droidkaigi2018.proguard.Hoge {
#    *;
#}
-keep class com.github.satoshun.droidkaigi2018.proguard.Hogegs
-keep @com.github.satoshun.droidkaigi2018.proguard.Hogegs class * {*;}
-keepclasseswithmembers class * {
    @com.github.satoshun.droidkaigi2018.proguard.Hogegs <methods>;
}
-keepclasseswithmembers class * {
    @com.github.satoshun.droidkaigi2018.proguard.Hogegs <fields>;
}
-keepclasseswithmembers class * {
    @com.github.satoshun.droidkaigi2018.proguard.Hogegs <init>(...);
}


# メンバーをキープ。クラス名は短縮
# 使っていない場合は削除。
#-keepclassmembernames class com.github.satoshun.droidkaigi2018.proguard.Hoge {
#    *;
##    android.view.View view2;
#}

# クラス名、メンバーをキープ
# 使っていない場合は指定されていても削除
#-keepnames class com.github.satoshun.droidkaigi2018.proguard.Hoge {
#    *;
##    android.view.View view2;
#}

#-dontwarn

# Gson
#-keepattributes Signature
# For using GSON @Expose annotation
#-keepattributes *Annotation*

-dontwarn okio.**
-dontwarn javax.annotation.**
#このアノテーションがついているメソッドを消さない(ただしclassが参照されている場合のみ)
-keepclasseswithmembers class * {
    @com.squareup.moshi.* <methods>;
}
#JsonQualifierを継承しているannotationを消さない
#Javaから参照されていない場合はstripされる
-keep @com.squareup.moshi.JsonQualifier interface *
