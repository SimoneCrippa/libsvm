#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([libsvm], [323])
AM_INIT_AUTOMAKE
AC_CONFIG_SRCDIR([svm.cpp])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([float.h limits.h locale.h stdlib.h string.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL
AC_C_INLINE

LT_INIT

# Checks for library functions.
AC_FUNC_REALLOC
AC_FUNC_STRTOD
AC_CHECK_FUNCS([setlocale sqrt strdup strrchr strtol])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
