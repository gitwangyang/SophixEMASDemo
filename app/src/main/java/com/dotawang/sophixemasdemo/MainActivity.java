package com.dotawang.sophixemasdemo;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;
import com.taobao.sophix.SophixManager;

/*
1、AndroidManifest不支持
2、build 基础依赖包升级不支持
3、导入sophix插件，无法直接打包

 */
public class MainActivity extends Activity {

    private ImageView imageView;
    private TextView textView;
    private TextView tv_code;
    private Handler handler = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        initData();
        initListener();

        updata(SophixStubApplication.cacheMsg.toString());

        findViewById(R.id.bt_crash).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                throw new RuntimeException();
            }
        });
        findViewById(R.id.bt_ca).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try{
                    Thread.sleep(20*1000);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        });
        findViewById(R.id.bt_query).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SophixManager.getInstance().queryAndLoadNewPatch();
            }
        });

        SophixStubApplication.msgDisplayListener = new SophixStubApplication.MsgDisplayListener() {
            @Override
            public void handle(final String msg) {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        updata(msg);
                    }
                });
            }
        };

        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                // 请求补丁
                SophixManager.getInstance().queryAndLoadNewPatch();
                handler.postDelayed(this, 10 * 1000);
            }
        }, 1 * 1000);


    }


    private void updata(String cacheMsg) {
        if (cacheMsg != null)
            tv_code.setText(cacheMsg);
    }

    private void initListener() {
        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //1、ic_launcher
                //2、https://i.loli.net/2018/09/12/5b9881e9ed5e8.jpg
                //3、test本地
                Picasso.with(MainActivity.this).load("https://i.loli.net/2018/09/12/5b9881e9ed5e8.jpg").into(imageView);
            }
        });
        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                textView.setText("修复1");
//                textView.setText("修复2");
//                textView.setText("修复3");
            }
        });
    }

    private void initData() {
        imageView = findViewById(R.id.iv);
        textView = findViewById(R.id.tv1);
        tv_code = findViewById(R.id.tv_code);
    }
}
