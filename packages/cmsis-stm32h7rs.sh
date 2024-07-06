version=1.1.0
description="CMSIS headers for STM32H7RS Series of ARM Cortex-M7 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeH7RS

family_definition=STM32H7RSxx

device_definitions=(
    STM32H7R3xx
    STM32H7R7xx
    STM32H7S3xx
    STM32H7S7xx
)

cmsis_headers=(
    core_cm7.h
    cmsis_version.h
    cmsis_compiler.h
    cmsis_gcc.h
    mpu_armv7.h
    cachel1_armv7.h
)

cpu=cortex-m7
fpu=fpv5-d16
