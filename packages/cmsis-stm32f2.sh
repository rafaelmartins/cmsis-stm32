version=1.9.4
description="CMSIS headers for STM32F2 Series of ARM Cortex-M3 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeF2

family_definition=STM32F2xx

device_definitions=(
    STM32F205xx
    STM32F207xx
    STM32F215xx
    STM32F217xx
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
