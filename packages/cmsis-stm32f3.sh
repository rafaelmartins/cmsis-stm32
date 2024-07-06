version=1.11.5
description="CMSIS headers for STM32F3 Series of ARM Cortex-M4 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeF3

family_definition=STM32F3xx

device_definitions=(
    STM32F301x8
    STM32F302x8
    STM32F302xC
    STM32F302xE
    STM32F303x8
    STM32F303xC
    STM32F303xE
    STM32F318xx
    STM32F328xx
    STM32F334x8
    STM32F358xx
    STM32F373xC
    STM32F378xx
    STM32F398xx
)

cmsis_headers=(
    core_cm4.h
    cmsis_version.h
    cmsis_compiler.h
    cmsis_gcc.h
    mpu_armv7.h
)

cpu=cortex-m4
fpu=fpv4-sp-d16
