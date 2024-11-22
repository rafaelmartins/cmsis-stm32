version=1.18.1
description="CMSIS headers for STM32L4 Series of ARM Cortex-M4 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeL4

family_definition=STM32L4xx

device_definitions=(
    STM32L412xx
    STM32L422xx
    STM32L431xx
    STM32L432xx
    STM32L433xx
    STM32L442xx
    STM32L443xx
    STM32L451xx
    STM32L452xx
    STM32L462xx
    STM32L471xx
    STM32L475xx
    STM32L476xx
    STM32L485xx
    STM32L486xx
    STM32L496xx
    STM32L4A6xx
    STM32L4P5xx
    STM32L4Q5xx
    STM32L4R5xx
    STM32L4R7xx
    STM32L4R9xx
    STM32L4S5xx
    STM32L4S7xx
    STM32L4S9xx
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
