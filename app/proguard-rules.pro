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

#基线包使用，生成mapping.txt
-printmapping mapping.txt
#生成的mapping.txt在app/build/outputs/mapping/release路径下，移动到/app路径下
#修复后的项目使用，保证混淆结果一致
#-applymapping mapping.txt
#hotfix
-keep class com.taobao.sophix.**{*;}
-keep class com.ta.utdid2.device.**{*;}
#防止inline
-dontoptimize
-keepclassmembers class com.dotawang.sophixemasdemo.WinnerApplication {
    public <init>();
}
-keep class com.dotawang.sophixemasdemo.SophixStubApplication$RealApplicationStub

-dontpreverify
-dontusemixedcaseclassnames
-optimizations  code/removal/simple,code/removal/advanced,code/removal/variable,code/removal/exception,code/simplification/branch,code/simplification/field,code/simplification/cast,code/simplification/arithmetic,code/simplification/variable
-keepattributes Exceptions,InnerClasses,Signature,SourceFile,LineNumberTable,*Annotation*
-renamesourcefileattribute Taobao
-allowaccessmodification
-optimizationpasses 1
#防止inline
-dontoptimize
-target 1.6

#-verbose
-dontskipnonpubliclibraryclasses
-dontskipnonpubliclibraryclassmembers
-dontwarn okio.**
-dontwarn com.squareup.okhttp.**
-dontwarn okhttp3.**
-dontwarn javax.annotation.**
-dontwarn com.android.volley.toolbox.**
-dontwarn com.facebook.infer.**
-dontwarn org.mozilla.javascript.**
-dontwarn org.mozilla.classfile.**
-dontwarn java.awt.**
-dontwarn com.taobao.**
-dontwarn com.google.android.maps.**
-dontwarn android.support.v7.widget.**
-dontwarn android.support.v4.**
-dontwarn com.tencent.mm.sdk.**
-dontwarn org.android.agoo.**
-dontwarn com.amap.api.**
-dontwarn com.autonavi.amap.**
-dontwarn com.ut.**
-dontwarn com.robotium.**
-dontwarn com.alibaba.fastjson.**
-dontwarn android.taobao.**
-dontwarn com.alibaba.mobileim.**
-dontwarn com.autonavi.**
-dontwarn com.amap.**
-dontwarn ***




#############公共的混淆keep选项， 可删除与工程中有重复部分 #############
-keep  class * extends android.app.Application
-keep  class * extends android.app.Activity
-keep  class * extends android.app.Service
-keep class com.google.inject.Binder
-keepclassmembers class * {
    @com.google.inject.Inject <init>(...);
}
# There's no way to keep all @Observes methods, so use the On*Event convention to identify event handlers
-keepclassmembers class * {
    void *(**On*Event);
}
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(...);
}
-keep public class roboguice.**

-keep class rx.**{*;}

# 为了atlas注入
-keepclassmembers class ** {
    private <init>(...);
    public <init>(...);
    <init>(...);
}

-keepclassmembernames class **.R$* {*;}
-keepclassmembernames class **.R {*;}
-keepclassmembers class **{
    public static final <fields>;
}
-keepclassmembers class * extends android.content.Context {
   public void *(android.view.View);
   public void *(android.view.MenuItem);
}

-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}


-keepclassmembers class * {
    public static ** asInterface(***);
}

-keepclassmembers class ** {
    public void onEvent*(***);
}

-keepclassmembers enum * {
  public static **[] values();
  public static ** valueOf(...);
  **[] $VALUES;
}

-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep native methods
-keepclassmembers class * {
    native <methods>;
}

-keepclassmembers class * implements java.io.Serializable {
    public <fields>;
    public <methods>;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

-keep class * implements android.os.Parcelable {
  public <fields>;
  public <methods>;
  public static final android.os.Parcelable$Creator *;
}
#############公共的混淆keep选项， 可删除与工程中有重复部分 #############

##########################基础库##########################
#fastjson
-keep class com.alibaba.fastjson.** {*;}

#tnet
#-keepclasseswithmembernames class org.android.spdy.** {
#    native <methods>;
#}
-keep public class org.android.spdy.**{*;}

#mtop
-keep class anetwork.network.cache.**{*;}
-keep class com.taobao.tao.remotebusiness.**{*;}
-keep class mtopsdk.**{*;}

#network
-keep class anet.channel.**{*;}
-keep class anetwork.channel.**{*;}
##########################基础库##########################

##########################高可用##########################
#keep ha alihatbadapter
-keep class com.alibaba.ha.**{*;}
-keep class com.taobao.tlog.**{*;}
#keep ha utdid
-keep class com.ut.device.**{*;}
-keep class com.ta.utdid2.device.**{*;}
#keep ha ut
-keep public class com.alibaba.mtl.** { *;}
-keep public class com.ut.mini.** { *;}
#keep ha crashreporter
-keep class com.alibaba.motu.crashreporter.**{ *;}
-keep class com.uc.crashsdk.**{*;}
#keep ha telescope
-keep class com.ali.telescope.**{ *;}
-keep class libcore.io.**{*;}
-keep class android.app.**{*;}
-keep class dalvik.system.**{*;}
#keep ha tlog
-keep class com.taobao.tao.log.**{*;}
-keep class com.taobao.android.tlog.**{*;}
#keep tbrest
-keep class com.alibaba.motu.**{*;}
##########################高可用##########################

###########################远程配置##########################
-keep class com.taobao.orange.**{*;}
###########################远程配置##########################

###########################其他##########################
-keep class sun.misc.Unsafe { *; }
-keep class com.alibaba.** {*;}
#关闭日志
#-assumenosideeffects class android.util.Log {
#    public static boolean isLoggable(java.lang.String, int);
#    public static int v(...);
#    public static int w(...);
#    public static int d(...);
#    public static int i(...);
#}
#-assumenosideeffects class java.lang.Throwable {
#    public void printStackTrace();
#}

-keep public class android.support.design.widget.BottomNavigationView { *; }
-keep public class android.support.design.internal.BottomNavigationMenuView { *; }
-keep public class android.support.design.internal.BottomNavigationPresenter { *; }
-keep public class android.support.design.internal.BottomNavigationItemView { *; }
###########################其他##########################

## 去除BottomNavigationView的tab大于三个的时候的切换效果
-keepclassmembers class android.support.design.internal.BottomNavigationMenuView {
    boolean mShiftingMode;
}

