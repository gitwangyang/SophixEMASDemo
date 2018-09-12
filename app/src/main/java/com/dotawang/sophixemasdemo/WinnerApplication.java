package com.dotawang.sophixemasdemo;

import android.app.Application;

import com.taobao.sophix.SophixManager;

/**
 * Created on 2018/9/12
 * Title:
 * Description:
 *
 * @author Android-汪洋
 *         update 2018/9/12
 */
public class WinnerApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        EmasInit emas = EmasInit.getInstance().setmApplication(this);
        emas.initHA();

        SophixManager.getInstance().queryAndLoadNewPatch();
    }
}
