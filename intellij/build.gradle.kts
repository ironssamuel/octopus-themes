plugins {
    id("org.jetbrains.intellij") version "1.17.4"
}

group = providers.gradleProperty("pluginGroup").get()
version = providers.gradleProperty("pluginVersion").get()

repositories {
    mavenCentral()
}

// IntelliJ Platform 2023.1 (since-build=231) requires targetCompatibility=17,
// even though this plugin has no Java sources of its own.
java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

// This is a pure theme/color-scheme plugin: no Kotlin or Java source,
// just resources (theme.json + editor color scheme XML) wired up via plugin.xml.
intellij {
    pluginName.set(providers.gradleProperty("pluginName"))
    version.set(providers.gradleProperty("platformVersion"))
    type.set(providers.gradleProperty("platformType"))
    updateSinceUntilBuild.set(false)
}

tasks {
    patchPluginXml {
        sinceBuild.set(providers.gradleProperty("pluginSinceBuild"))
    }

    // No compiled code — skip the build steps that expect a JVM toolchain / sources.
    compileJava { enabled = false }
    compileTestJava { enabled = false }
    test { enabled = false }
}
