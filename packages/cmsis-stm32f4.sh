version=1.28.1
description="CMSIS headers for STM32F4 Series of ARM Cortex-M4 microcontrollers"
license=Apache-2.0
github_repository=STMicroelectronics/STM32CubeF4

family_definition=STM32F4xx

device_definitions=(
    STM32F401xC
    STM32F401xE
    STM32F405xx
    STM32F407xx
    STM32F410Cx
    STM32F410Rx
    STM32F410Tx
    STM32F411xE
    STM32F412Cx
    STM32F412Rx
    STM32F412Vx
    STM32F412Zx
    STM32F413xx
    STM32F415xx
    STM32F417xx
    STM32F423xx
    STM32F427xx
    STM32F429xx
    STM32F437xx
    STM32F439xx
    STM32F446xx
    STM32F469xx
    STM32F479xx
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
