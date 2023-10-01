/*
 * Copyright (c) 2018 Jan Van Winkel <jan.van_winkel@dxplore.eu>
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr/kernel.h>
#include <stdio.h>
#include <zephyr/usb/usb_device.h>
#include <zephyr/drivers/gpio.h>

int main(void) {
    if (usb_enable(NULL)) {
        return -1;
    }

    struct gpio_dt_spec led_b = GPIO_DT_SPEC_GET(DT_NODELABEL(blue_led), gpios);
    gpio_pin_configure_dt(&led_b, GPIO_OUTPUT_INACTIVE);
    while (1) {
        gpio_pin_toggle_dt(&led_b);
        k_sleep(K_MSEC(1000));
    }
    return 0;
}