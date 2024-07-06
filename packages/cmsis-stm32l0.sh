version=1.12.2
description="CMSIS headers for STM32L0 Series of ARM Cortex-M0+ microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeL0

family_definition=STM32L0xx

device_definitions=(
    STM32L010x4
    STM32L010x6
    STM32L010x8
    STM32L010xB
    STM32L011xx
    STM32L021xx
    STM32L031xx
    STM32L041xx
    STM32L051xx
    STM32L052xx
    STM32L053xx
    STM32L062xx
    STM32L063xx
    STM32L071xx
    STM32L072xx
    STM32L073xx
    STM32L081xx
    STM32L082xx
    STM32L083xx
)

cmsis_headers=(
    core_cm0plus.h
    cmsis_version.h
    cmsis_compiler.h
    cmsis_gcc.h
    mpu_armv7.h
)

cpu=cortex-m0plus
fpu=
