#define _GNU_SOURCE
#include <fcntl.h>
#include <stdarg.h>
#include <dlfcn.h>

int (*__fcntl__)(int fd, int cmd, ...);

__attribute__((constructor))
void nolock_init()
{
    __fcntl__ = dlsym(RTLD_NEXT, "fcntl");
}

int fcntl(int fd, int cmd, ...)
{
    va_list ap;
    long arg;
    va_start(ap, cmd);
    arg = va_arg(ap, long);
    va_end(ap);

    if (cmd == F_GETLK || cmd == F_SETLK || cmd == F_SETLKW)
        return 0;

    return __fcntl__(fd, cmd, arg);
}
