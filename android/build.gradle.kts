allprojects {
    repositories {
        maven { url = uri("https://maven.devneeds.ir") }
        maven {
            url = uri("https://mirror-maven.runflare.com/android/maven2/")
        }
        maven {
            url = uri("https://mirror-maven.runflare.com/maven2/")
        }
        maven {
            url = uri("https://mirror-maven.runflare.com/gradle-plugins/")
        }
        maven { url = uri("https://pub-azs.ir/api/mavens/") }
        maven { url = uri("https://jitpack.io") }
        google()
        mavenCentral()
        gradlePluginPortal()
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

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
