package com.github.satoshun.droidkaigi2018.proguard

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import com.squareup.moshi.FromJson
import com.squareup.moshi.JsonQualifier
import com.squareup.moshi.Moshi
import com.squareup.moshi.ToJson


//import javax.annotation.Nullable

class MainActivity : AppCompatActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.main_act)

    val moshi = Moshi.Builder()
        .add(ColorAdapter())
        .build()
    val jsonAdapter = moshi.adapter(Hoge::class.java)
    val hoge = jsonAdapter.fromJson("")

    // retain HexColor annotation and all with methods
//    val color = HexColor::class
//    println(color)

//    val hoge = Hoge()
//    hoge.niko()
//    hoge.args(10)
//    oooooo(HHHHHH())
  }

//  fun oooooo(view: HHHHHH) {
//    println("HOGE: ${view.javaClass.annotations.size}")
//
//    view.javaClass.annotations.forEach {
//      println("HOGE: ${it}")
//
//      if (it is Hogegs) {
//        Log.d("Log", "find Hogegs")
//      }
//      if (it is Nullable) {
//        Log.d("Log", "find Nullable")
//      }
//    }
//  }
}


class Hoge {
  private val abc: String = ""
  private lateinit var view: View
  private lateinit var view2: View

  @Hogegs
  fun fuga() {
    println(abc)
  }

  fun niko() {
    println(view)
  }

//  fun args(a: Int = 10, b: Int = 20) {
//    println(a + b)
//  }
}

@Retention(AnnotationRetention.RUNTIME)
@JsonQualifier
annotation class HexColor

annotation class Hogegs

//@Nullable
//class HHHHHH

class ColorAdapter {
  @ToJson fun toJson(@HexColor rgb: Int): String {
    return String.format("#%06x", rgb)
  }

  @FromJson @HexColor fun fromJson(rgb: String): Int {
    return Integer.parseInt(rgb.substring(1), 16)
  }
}
