SRC := src/main/scala/vexriscv/GenCoreDefault.scala

all: 2-stage-no-cache-debug 4-stage-no-cache-debug 5-stage-pipelined-no-cache-debug

migen: VexRiscv.v VexRiscv_Debug.v VexRiscv_Lite.v VexRiscv_LiteDebug.v VexRiscv_Min.v VexRiscv_MinDebug.v

VexRiscv.v: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault"

VexRiscv_Debug.v: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault -d --outputFile VexRiscv_Debug"

VexRiscv_Lite.v: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleMulDiv false --outputFile VexRiscv_Lite"

VexRiscv_LiteDebug.v: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault -d --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleMulDiv false --outputFile VexRiscv_LiteDebug"

VexRiscv_Min.v: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_Min"

VexRiscv_MinDebug.v: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_MinDebug"

2-stage-no-cache-debug: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 2-stage-no-cache-debug --pipelining false --memoryStage false --writeBackStage false"

4-stage-no-cache-debug: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 4-stage-no-cache-debug --pipelining false --memoryStage true --writeBackStage true"

5-stage-pipelined-no-cache-debug: $(SRC)
	sbt compile "run-main vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 2-stage-no-cache-debug --pipelining false --memoryStage false --writeBackStage false"