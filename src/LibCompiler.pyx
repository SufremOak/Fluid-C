from libc.stdlib cimport system, free
from libc.string cimport strdup

cdef extern from "stdlib.h":
    int system(const char *command)

cdef class GCCCompiler:
    cdef char* compile_command

    def __cinit__(self, compile_command):
        self.compile_command = strdup(compile_command)

    def __dealloc__(self):
        free(self.compile_command)

    def compile(self):
        return system(<const char*>self.compile_command)
