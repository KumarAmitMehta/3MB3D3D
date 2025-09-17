
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

#define SLEEP_TIME_MS   1000
int main(void) 
{
    LOG_INF("Entering main\n");
    while (1) 
    {
        k_msleep(SLEEP_TIME_MS);
    }
    
    return 0;
}

