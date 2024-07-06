version=1.11.2
description="CMSIS headers for STM32H7 Series of ARM Cortex-M7 microcontrollers (single-core only)"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeH7

family_definition=STM32H7xx

device_definitions=(
    STM32H723xx
    STM32H725xx
    STM32H730xx
    STM32H730xxQ
    STM32H733xx
    STM32H735xx
    STM32H742xx
    STM32H743xx
    STM32H750xx
    STM32H753xx
    STM32H7A3xx
    STM32H7A3xxQ
    STM32H7B0xx
    STM32H7B0xxQ
    STM32H7B3xx
    STM32H7B3xxQ
)

cmsis_headers=(
    core_cm7.h
    cmsis_version.h
    cmsis_compiler.h
    cmsis_gcc.h
    mpu_armv7.h
)

system_source=system_stm32h7xx_singlecore.c

cpu=cortex-m7
fpu=fpv5-d16
