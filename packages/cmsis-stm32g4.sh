version=1.6.0
description="CMSIS headers for STM32G4 Series of ARM Cortex-M4 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeG4

family_definition=STM32G4xx

device_definitions=(
    STM32G414xx
    STM32G431xx
    STM32G441xx
    STM32G471xx
    STM32G473xx
    STM32G474xx
    STM32G483xx
    STM32G484xx
    STM32G491xx
    STM32G4A1xx
    STM32GBK1CB
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
