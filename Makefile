SRC := src/main/scala/vexriscv/GenCoreDefault.scala

all: \
	2-stage-1024-cache-debug.v \
	4-stage-1024-cache-debug.v \
	2-stage-2048-cache-debug.v \
	2-stage-2048-cache.v \
	2-stage-no-cache-debug.v \
	4-stage-no-cache-debug.v \
	5-stage-pipelined-no-cache-debug.v \

migen: VexRiscv.v VexRiscv_Debug.v VexRiscv_Lite.v VexRiscv_LiteDebug.v VexRiscv_Min.v VexRiscv_MinDebug.v

VexRiscv.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault"

VexRiscv_Debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --outputFile VexRiscv_Debug"

VexRiscv_Lite.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleMulDiv false --outputFile VexRiscv_Lite"

VexRiscv_LiteDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleMulDiv false --outputFile VexRiscv_LiteDebug"

VexRiscv_Min.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_Min"

VexRiscv_MinDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_MinDebug"

2-stage-1024-cache.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --iCacheSize 1024 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 2-stage-1024-cache --pipelining false --memoryStage false --writeBackStage false"

2-stage-1024-cache-debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 1024 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 2-stage-1024-cache-debug --pipelining false --memoryStage false --writeBackStage false"

2-stage-2048-cache.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --iCacheSize 2048 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 2-stage-2048-cache --pipelining false --memoryStage false --writeBackStage false"

2-stage-2048-cache-debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 2048 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 2-stage-2048-cache-debug --pipelining false --memoryStage false --writeBackStage false"

2-stage-no-cache-debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 2-stage-no-cache-debug --pipelining false --memoryStage false --writeBackStage false"

4-stage-no-cache-debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 4-stage-no-cache-debug --pipelining false --memoryStage true --writeBackStage true"

4-stage-1024-cache-debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 1024 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 4-stage-1024-cache-debug --pipelining false --memoryStage true --writeBackStage true"

5-stage-pipelined-no-cache-debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile 2-stage-no-cache-debug --pipelining false --memoryStage false --writeBackStage false"