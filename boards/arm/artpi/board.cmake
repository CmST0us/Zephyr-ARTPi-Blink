# SPDX-License-Identifier: Apache-2.0

board_runner_args(openocd --cmd-post-verify "reset init")
board_runner_args(openocd --cmd-reset-halt "reset init")
board_runner_args(openocd --target-handle=_CHIPNAME.cpu0)
board_runner_args(jlink "--device=STM32H750XBH6" "--speed=4000")
board_runner_args(stm32cubeprogrammer "--port=swd" "--reset=hw" "--tool-opt=-el" "--tool-opt=${CMAKE_CURRENT_LIST_DIR}/support/ART-Pi_W25Q64.stldr")

include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
include(${ZEPHYR_BASE}/boards/common/stm32cubeprogrammer.board.cmake)
