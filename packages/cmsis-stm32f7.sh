version=1.17.2
description="CMSIS headers for STM32F7 Series of ARM Cortex-M7 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeF7

family_definition=STM32F7xx

device_definitions=(
    STM32F722xx
    STM32F723xx
    STM32F730xx
    STM32F732xx
    STM32F733xx
    STM32F745xx
    STM32F746xx
    STM32F750xx
    STM32F756xx
    STM32F765xx
    STM32F767xx
    STM32F769xx
    STM32F777xx
    STM32F779xx
)

cmsis_headers=(
    core_cm7.h
    cmsis_version.h
    cmsis_compiler.h
    cmsis_gcc.h
    mpu_armv7.h
)

cpu=cortex-m7
fpu=fpv5-sp-d16
fpu_STM32F765xx=fpv5-d16
fpu_STM32F767xx=fpv5-d16
fpu_STM32F768xx=fpv5-d16
fpu_STM32F769xx=fpv5-d16
fpu_STM32F777xx=fpv5-d16
fpu_STM32F778xx=fpv5-d16
fpu_STM32F779xx=fpv5-d16
