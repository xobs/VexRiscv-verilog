SRC := src/main/scala/vexriscv/GenCoreDefault.scala

all: \
	VexRiscv_Fomu.v \
	VexRiscv_Fomu_Debug.v \
	VexRiscv_HaD.v \
	VexRiscv_Had_Debug.v \
	VexRiscv_BetrustedSoC.v \
	VexRiscv_BetrustedSoC_Debug.v

VexRiscv_Fomu.v: src/main/scala/vexriscv/GenFomu.scala
	sbt compile "runMain vexriscv.GenFomu --iCacheSize 2048 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile $(basename $@) --pipelining false --memoryStage false --writeBackStage false --withMmu true"

VexRiscv_Fomu_Debug.v: src/main/scala/vexriscv/GenFomu.scala
	sbt compile "runMain vexriscv.GenFomu --iCacheSize 2048 --dCacheSize 0 --mulDiv false --singleCycleMulDiv false --outputFile $(basename $@) --pipelining false --memoryStage false --writeBackStage false --withMmu true -d --hardwareBreakpointCount 2"

VexRiscv_Fomu_Crypto.v: src/main/scala/vexriscv/GenFomuCrypto.scala
	sbt compile "runMain vexriscv.GenFomuCrypto --iCacheSize 4096 --dCacheSize 0 --mulDiv true --singleCycleMulDiv true --outputFile $(basename $@) --pipelining false --memoryStage false --writeBackStage false --withMmu false"

VexRiscv_Fomu_Crypto_Debug.v: src/main/scala/vexriscv/GenFomuCrypto.scala
	sbt compile "runMain vexriscv.GenFomuCrypto --iCacheSize 4096 --dCacheSize 0 --mulDiv true --singleCycleMulDiv true --outputFile $(basename $@) --pipelining false --memoryStage false --writeBackStage false --withMmu false -d --hardwareBreakpointCount 2"

VexRiscv_HaD.v: src/main/scala/vexriscv/GenHaD.scala
	sbt compile "runMain vexriscv.GenHaD --outputFile $(basename $@)"

VexRiscv_HaD_Debug.v: src/main/scala/vexriscv/GenHaD.scala
	sbt compile "runMain vexriscv.GenHaD --outputFile $(basename $@) -d --hardwareBreakpointCount 4"

VexRiscv_BetrustedSoC.v: src/main/scala/vexriscv/GenBetrustedSoC.scala
	sbt compile "runMain vexriscv.GenBetrustedSoC --outputFile $(basename $@)"

VexRiscv_BetrustedSoC_Debug.v: src/main/scala/vexriscv/GenBetrustedSoC.scala
	sbt compile "runMain vexriscv.GenBetrustedSoC --outputFile $(basename $@) -d --hardwareBreakpointCount 4"

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
