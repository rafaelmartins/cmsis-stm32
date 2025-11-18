version=1.4.0
description="CMSIS headers for STM32C0 Series of ARM Cortex-M0+ microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeC0

family_definition=STM32C0xx

device_definitions=(
    STM32C011xx
    STM32C031xx
    STM32C051xx
    STM32C071xx
    STM32C091xx
    STM32C092xx
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
