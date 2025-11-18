version=1.6.2
description="CMSIS headers for STM32G0 Series of ARM Cortex-M0+ microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeG0

family_definition=STM32G0xx

device_definitions=(
    STM32G030xx
    STM32G031xx
    STM32G041xx
    STM32G050xx
    STM32G051xx
    STM32G061xx
    STM32G070xx
    STM32G071xx
    STM32G081xx
    STM32G0B0xx
    STM32G0B1xx
    STM32G0C1xx
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
