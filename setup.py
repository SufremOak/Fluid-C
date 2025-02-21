from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

extensions = [
    Extension(
        "LibCompiler",
        sources=["src/LibCompiler.pyx"],
        language="c++",
    )
]

setup(
    name="LibCompiler",
    ext_modules=cythonize(extensions),
)