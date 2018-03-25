package com.example.tan089.ourladyhope;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

public class Calendar extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calendar);
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
    }
}
