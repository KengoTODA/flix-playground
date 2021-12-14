// https://docs.gradle.org/7.3/userguide/composite_builds.html#included_plugin_builds
pluginManagement {
    includeBuild("../flix-gradle-plugin")
}
rootProject.name = "flix-playground"
