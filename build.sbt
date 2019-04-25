
lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "com.github.spinalhdl",
      scalaVersion := "2.11.6",
      version      := "1.0.0"
    )),
    name := "VexRiscvOnWishbone"
  ).dependsOn(vexRiscv)

//lazy val vexRiscv = RootProject(uri("git://github.com/SpinalHDL/VexRiscv.git#9a61ff83476e63c529d1e16d75c7d33a23096b4f"))
lazy val vexRiscv = RootProject(file("VexRiscv"))

//addCompilerPlugin("org.scala-lang.plugins" % "scala-continuations-plugin_2.11.6" % "1.0.2")
//scalacOptions += "-P:continuations:enable"
fork := true
