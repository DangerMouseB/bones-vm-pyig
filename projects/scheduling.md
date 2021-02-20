## Wishlist

1. any vulnerabilities get discovered by PyCharm in the variable inspector in debug mode - stop that happening
2. have a clear public api (keeping pyd "wrap" api)
3. be deployable on pypi

4. all pyd examples and tests should work
5. use a d testing framework as well as python tests


<br>

## Next stage [MoSCoW]

#### MustDo



#### ShouldDo



#### CouldDo
* extend config to have better control over compile time logging


#### WontDo
* blend normal arguments with PyObject*[] args and PyObject*[string] kwargs - for moment just the three combinations of args + kwargs or current implementation

<br>

## Completed

#### to 2021.02.14

* add __hash__ so a struct can be used as a key in a python dict
* fix segmentation fault when accessing a struct member

#### to 2021.02.07

* added licenses
* described repo in readme and set up https://dangermouseb.github.io/bones-vm-pyig/

#### to 2021.01.31

* structs working
* @\_\_richcmpfunc__ instead of opCmp (so can return Py_RETURN_NOTIMPLEMENTED), also don't need opEquals
* @args, @kwargs  - as function attrs rather than parameter attrs - can't blend with other variables yet
* refactoring and tidyup - naming to reflect cpython api where possible
* keep old d api used in the pyd examples - needs testing
* gives a detailed log as compiling to make it easier to debug