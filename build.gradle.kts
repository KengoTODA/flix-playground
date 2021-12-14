plugins {
    `java-library`
    id("jp.skypencil.flix")
}

tasks.named<Jar>("jar") {
    from("$buildDir/classes/flix/main")
}

tasks.named<Task>("classes") {
    dependsOn("compileFlix")
}
