import org.gradle.api.GradleException
import org.gradle.api.Project
import java.io.File
import java.util.Properties

plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

group = "dev.expressive_theme_bridge"
version = "1.0.0"

fun Project.flutterRoot(): String {
    val candidateProperties = listOf(
        findProperty("flutter-root")?.toString(),
        findProperty("flutter.sdk")?.toString(),
        System.getenv("FLUTTER_ROOT")
    )

    val flutterRoot = candidateProperties.firstOrNull { !it.isNullOrBlank() }
    if (!flutterRoot.isNullOrBlank()) return flutterRoot

    val localProperties = Properties()
    val localPropertiesFile = rootProject.file("local.properties")
    if (localPropertiesFile.exists()) {
        localPropertiesFile.inputStream().use { localProperties.load(it) }
        val fromLocal = localProperties.getProperty("flutter.sdk")
        if (!fromLocal.isNullOrBlank()) return fromLocal
    }

    throw GradleException(
        "Flutter SDK not found. Set -Pflutter-root, flutter.sdk, FLUTTER_ROOT or local.properties/flutter.sdk."
    )
}

fun Project.flutterEngineVersion(): String {
    val engineVersionFile = File(flutterRoot(), "bin/internal/engine.version")
    if (!engineVersionFile.exists()) {
        throw GradleException(
            "Flutter engine version file not found at: ${engineVersionFile.absolutePath}"
        )
    }
    return engineVersionFile.readText().trim()
}

android {
    namespace = "dev.expressive_theme_bridge"
    compileSdk = 35

    defaultConfig {
        minSdk = 21
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    buildFeatures {
        buildConfig = true
        compose = false
    }
}

dependencies {
    val engineVersion = flutterEngineVersion()
    compileOnly("io.flutter:flutter_embedding_release:1.0.0-$engineVersion") {
        isTransitive = false
    }
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("com.google.android.material:material:1.12.0")
}
