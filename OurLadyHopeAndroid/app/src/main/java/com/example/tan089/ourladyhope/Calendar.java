package com.example.tan089.ourladyhope;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

public class Calendar extends AppCompatActivity {
    private ImageView img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, imgChristmas;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calendar);
        img1 = (ImageView) findViewById(R.id.img1);
        img2 = (ImageView) findViewById(R.id.img2);
        img3 = (ImageView) findViewById(R.id.img3);
        img4 = (ImageView) findViewById(R.id.img4);
        img5 = (ImageView) findViewById(R.id.img5);
        img6 = (ImageView) findViewById(R.id.img6);
        img7 = (ImageView) findViewById(R.id.img7);
        img8 = (ImageView) findViewById(R.id.img8);
        img9 = (ImageView) findViewById(R.id.img9);
        img10 = (ImageView) findViewById(R.id.img10);
        img11 = (ImageView) findViewById(R.id.img11);
        img12 = (ImageView) findViewById(R.id.img12);
        imgChristmas = (ImageView) findViewById(R.id.imgChristmas);

        BottomNavigationView bottomNavigationView = (BottomNavigationView) findViewById(R.id.bottomNav);
        BottomNavigationHelper.disableShiftMode(bottomNavigationView);
        Menu menu = bottomNavigationView.getMenu();
        MenuItem menuItem = menu.getItem(0);
        menuItem.setChecked(true);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                switch (item.getItemId()){
                    case R.id.home:
                        Intent toHome = new Intent(Calendar.this, MainActivity.class);
                        startActivity(toHome );
                        break;
                    case R.id.calendar:
                        //Toast.makeText(MainActivity.this, "Calendar", Toast.LENGTH_SHORT).show();
//                        Intent toCalendar = new Intent(Calendar.this, Calendar.class);
//                        startActivity(toCalendar);
                        break;
                    case R.id.events:
                        Toast.makeText(Calendar.this, "Events", Toast.LENGTH_SHORT).show();
                        break;
                    case R.id.account:
                        Toast.makeText(Calendar.this, "account", Toast.LENGTH_SHORT).show();
                        break;
                    case R.id.aboutUs:
                        Toast.makeText(Calendar.this, "about us", Toast.LENGTH_SHORT).show();
                        break;
                }
                return true;
            }

        });

        loadImages(CalendarURLs.IMPORTANT_DATES, img1);
        loadImages(CalendarURLs.JAN, img2);
        loadImages(CalendarURLs.FEB, img3);
        loadImages(CalendarURLs.MAR, img4);
        loadImages(CalendarURLs.APR, img5);
        loadImages(CalendarURLs.MAY, img6);
        loadImages(CalendarURLs.JUN, img7);
        loadImages(CalendarURLs.JUL, img8);
        loadImages(CalendarURLs.AUG, img9);
        loadImages(CalendarURLs.SEP, img10);
        loadImages(CalendarURLs.OTC, img11);
        loadImages(CalendarURLs.NOV, img12);
        loadImages(CalendarURLs.DEC, imgChristmas);

    }

    private ImageView loadImages(String url, ImageView image) {
        Picasso.with(getApplicationContext())
                .load(url)
                .into(image);
        return image;
    }
}
