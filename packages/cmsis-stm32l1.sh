version=1.10.4
description="CMSIS headers for STM32L1 Series of ARM Cortex-M3 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeL1

family_definition=STM32L1xx

device_definitions=(
    STM32L100xB
    STM32L100xBA
    STM32L100xC
    STM32L151xB
    STM32L151xBA
    STM32L151xC
    STM32L151xCA
    STM32L151xD
    STM32L151xDx
    STM32L151xE
    STM32L152xB
    STM32L152xBA
    STM32L152xC
    STM32L152xCA
    STM32L152xD
    STM32L152xDx
    STM32L152xE
    STM32L162xC
    STM32L162xCA
    STM32L162xD
    STM32L162xDx
    STM32L162xE
)

cmsis_headers=(
    core_cm3.h
    cmsis_version.h
    cmsis_compiler.h
    cmsis_gcc.h
    mpu_armv7.h
)

cpu=cortex-m3
fpu=
