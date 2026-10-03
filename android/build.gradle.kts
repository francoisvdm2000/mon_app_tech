allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Contournement 16 KB page size (Google Play, obligatoire depuis le
// 31/05/2026) : shared_preferences_android 2.4.20+ embarque
// androidx.datastore 1.2.0, dont libdatastore_shared_counter.so n'est pas
// encore compatible 16 Ko (régression connue par rapport à la 1.1.7, qui
// l'était). Tant que le correctif n'est pas remonté dans le plugin Flutter
// (github.com/flutter/flutter/issues/182744), on force la résolution vers
// la dernière version compatible.
subprojects {
    configurations.all {
        resolutionStrategy {
            force("androidx.datastore:datastore:1.1.7")
            force("androidx.datastore:datastore-android:1.1.7")
            force("androidx.datastore:datastore-core:1.1.7")
            force("androidx.datastore:datastore-core-android:1.1.7")
            force("androidx.datastore:datastore-preferences:1.1.7")
            force("androidx.datastore:datastore-preferences-android:1.1.7")
        }
    }
}

subprojects {
    tasks.withType<JavaCompile>().configureEach {
        sourceCompatibility = JavaVersion.VERSION_17.toString()
        targetCompatibility = JavaVersion.VERSION_17.toString()
        options.compilerArgs.add("-Xlint:-options")
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
