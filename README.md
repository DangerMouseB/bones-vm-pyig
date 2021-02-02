## bones-vm-pyig

See https://dangermouseb.github.io/bones-vm-pyig/ for usage documentation.

<br>

### Abstract

This repo is based on code from [pyd]() and [autowrap](https://github.com/symmetryinvestments/autowrap) but serves a different need - that of supporting 
a Python programmer to implement extensions in D.

Complete control of the generated interface is provided via [user defined attributes (UDAs)](https://tour.dlang.org/tour/en/gems/attributes) rather than 
mapping D functions and operators verbatim. As an example take the impedance mismatch between D's opCmp and opEquals and Python's rich comparison 
functionality - compare https://dlang.org/spec/operatoroverloading.html#eqcmp 
[tp_richcompare](https://docs.python.org/3/c-api/typeobj.html#c.PyTypeObject.tp_richcompare) and
[PyObject_RichCompare](https://docs.python.org/3/c-api/object.html#c.PyObject_RichCompare)). Instead of attempting to select a suitable combination 
of *opCmp* / *opEquals* overloads a function may be instead marked with *@\_\_richcmpfunc__*. 

The intention is to provide UDAs that are familiar to Python programmers, e.g. *\_\_add__*, *\_\_radd__ etc*, where possible and if not possible, that 
closely correspond to the [Python 3 C API](https://docs.python.org/3/c-api/), e.g. *\_\_getitem__mp__* maps to 
[mp_subscript](https://docs.python.org/3/c-api/typeobj.html#mapping-object-structures), and @args and @kwargs are used to indicate variadic 
arguments (as per common Python usage).

NB: D discourages functions to be prefixes with \_\_, however, conveniently for us, \_\_ works fine for enums.

<br>



### Repo Structure

./doc - repo documentation
./docs - github.io markdown documents for usage documentation\
./examples - non-trivial examples of the attributes in action\
./licenses - other licenses as required by agreements\
./projects - a project is a collection of one or more tasks - each sub-folder contains all necessary files including notes, documentation, 
  research references, TDD style test, etc to complete a project.\
./src - d source code\
./src/bones/pyig - blend of pyd, autowrap and original code\
./src/deimos - snapshot from pyd project\
./src/pyd - snapshot from pyd files that haven't been refactored wholesale yet\

<br>

### Bones

In case you're curious, bones is a collection of hobby utilities (including a toy vm) to assist my children in learning how to program and me to learn D.
