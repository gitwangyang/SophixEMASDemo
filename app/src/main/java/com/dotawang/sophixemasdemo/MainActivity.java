package com.dotawang.sophixemasdemo;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

/*
1、AndroidManifest不支持
2、build 基础依赖包升级不支持
3、导入sophix插件，无法直接打包

 */
public class MainActivity extends Activity {

    private ImageView imageView;
    private TextView textView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initData();
        initListener();
    }

    private void initListener() {
        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //1、ic_launcher
                //2、https://i.loli.net/2018/09/12/5b9881e9ed5e8.jpg
                //3、test本地
//                Picasso.with(MainActivity.this).load("https://i.loli.net/2018/09/12/5b9881e9ed5e8.jpg").into(imageView);
            }
        });
        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                textView.setText("修复1");
//                textView.setText("修复2");
//                textView.setText("修复3");
            }
        });
    }

    private void initData() {
        imageView = findViewById(R.id.iv);
        textView = findViewById(R.id.tv1);
    }
}
