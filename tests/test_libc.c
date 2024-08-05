/*
** EPITECH PROJECT, 2024
** B-ASM-400-PAR-4-1-asmminilibc-naira.awadin
** File description:
** test_libc
*/

#include <stdlib.h>
#include <dlfcn.h>
#include <criterion/criterion.h>
#include <criterion/redirect.h>

Test (tests_minilibc, strrchr_tests)
{
    char *(*strrchr)(const char *s, int c);
    void *handle;
    char *str = "Epitech";
    char *str2 = "Taoyota";

    handle = dlopen("./libasm.so", RTLD_LAZY);
    if (!handle) {
        return;
    }
    strrchr = dlsym(handle, "strrchr");
    if (dlerror() != NULL) {
        return;
    }
    cr_assert_str_eq((*strrchr)(str, 'p'), "pitech");
    cr_assert_str_eq((*strrchr)(str2, 'a'), "a");
    cr_assert_str_eq((*strrchr)(str2, 'o'), "ota");
    cr_assert_str_eq((*strrchr)(str, '\0'), "");
    cr_assert_eq((*strrchr)(str2, 'e'), NULL);
    cr_assert_str_eq((*strrchr)(str2, '\0'), "");
    dlclose(handle);
}

Test (tests_minilibc, memset_tests)
{
    void *handle;
    void *(*memset)(void *__s, int __c, size_t __n);
    char *memory = malloc(sizeof(char) * 7);
    char *memory2 = malloc(sizeof(char) * 10);
    int *arr = malloc(sizeof(int) * 10);
    int arr_expected[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    handle = dlopen("./libasm.so", RTLD_LAZY);
    if (!handle) {
        return;
    }
    memset = dlsym(handle, "memset");
    if (dlerror() != NULL) {
        return;
    }
    memset(memory, 'a', 5);
    cr_assert_str_eq(memory, "aaaaa");
    memset(memory, 'e', 4);
    cr_assert_str_eq(memory, "eeeea");
    memset(memory2, 'o', 4);
    cr_assert_str_eq(memory2, "oooo");
    memset(arr, 0, 10 * sizeof(arr[0]));
    cr_assert_arr_eq(arr, arr_expected, 10);
    dlclose(handle);
    free(memory);
    free(memory2);
}

Test (tests_minilibc, memcpy_tests)
{
    void *handle;
    void *(*memcpy)(void *__restrict__ __dest, const void *__restrict__ __src, size_t __n);
    char *memory = malloc(sizeof(char) * 7);
    char *memory2 = malloc(sizeof(char) * 10);

    handle = dlopen("./libasm.so", RTLD_LAZY);
    if (!handle) {
        return;
    }
    memcpy = dlsym(handle, "memcpy");
    if (dlerror() != NULL) {
        return;
    }
    memset(memory, 'a', 5);
    memset(memory, 'e', 4);
    memset(memory2, 'o', 4);
    memcpy(memory, "epitech", 4);
    memcpy(memory2, "epitech", 4);
    cr_assert_str_eq(memory, "epita");
    cr_assert_str_eq(memory2, "epit");
    dlclose(handle);
    free(memory);
    free(memory2);
}

Test (tests_minilibc, strcmp_tests)
{
    void *handle;
    int (*strcmp)(const char *s1, const char *s2);
    char *str = "Epitech";
    char *str2 = "Taoyota";
    char *str3 = "";
    char *str4 = "Epot";

    handle = dlopen("./libasm.so", RTLD_LAZY);
    if (!handle) {
        return;
    }
    strcmp = dlsym(handle, "strcmp");
    if (dlerror() != NULL) {
        return;
    }
    cr_assert_eq((*strcmp)(str2, str), 15);
    cr_assert_eq((*strcmp)(str, str), 0);
    cr_assert_eq((*strcmp)(str3, str), 10);
    cr_assert_eq((*strcmp)(str, str3), -10);
    dlclose(handle);
}
