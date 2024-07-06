version=1.11.5
description="CMSIS headers for STM32F0 Series of ARM Cortex-M0 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeF0

family_definition=STM32F0xx

device_definitions=(
    STM32F030x6
    STM32F030x8
    STM32F030xC
    STM32F031x6
    STM32F038xx
    STM32F042x6
    STM32F048xx
    STM32F051x8
    STM32F058xx
    STM32F070x6
    STM32F070xB
    STM32F071xB
    STM32F072xB
    STM32F078xx
    STM32F091xC
    STM32F098xx
)

cmsis_headers=(
    core_cm0.h
    cmsis_version.h
    cmsis_compiler.h
    cmsis_gcc.h
)

cpu=cortex-m0
fpu=
