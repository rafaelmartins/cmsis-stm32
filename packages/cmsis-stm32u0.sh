version=1.1.0
description="CMSIS headers for STM32U0 Series of ARM Cortex-M0+ microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeU0

family_definition=STM32U0xx

device_definitions=(
    STM32U031xx
    STM32U073xx
    STM32U083xx
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
