version=1.8.5
description="CMSIS headers for STM32F1 Series of ARM Cortex-M3 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeF1

family_definition=STM32F1xx

device_definitions=(
    STM32F100xB
    STM32F100xE
    STM32F101x6
    STM32F101xB
    STM32F101xE
    STM32F101xG
    STM32F102x6
    STM32F102xB
    STM32F103x6
    STM32F103xB
    STM32F103xE
    STM32F103xG
    STM32F105xC
    STM32F107xC
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
