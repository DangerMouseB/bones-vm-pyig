https://dangermouseb.github.io/bones-vm-pyig/

## bones-vm-pyig

### Abstract


### Structure

./projects - each sub-folder contains all the files for a project, including notes/documentation, 
  research

./src - d source code\
./src/bones/pyig\
./src/deimos - snapshot from pyd project\
./src/pyd - files that haven't been refactored wholesale yet\



Utilities to interface D to Python - derived from autowrap:pyd and pyd. 

Provides markup (via User Defined Attributes - UDAs) to expose d 
functions, structs, etc to python without requiring redesign of d code, just markup and clarification code.

<br> 

What does this give us?

We like the way autowrap hoovers up all the definitions (functions, classes, structs, members, methods, etc) but sometimes 
we need finer grained control and also don't want to change the api of the d code just to accommodate a python client. By
providing attributes we can mark up methods to give this control, for example:

1) toString is mapped to \_\_repr__ but we might like to add a more specialised \_\_repr__ function for python user. 
    And also provide a \_\_str__.
2) currently a mismatch between the d signature and the calling code causes a D runtime error but we might like to 
   return NotImplemented (in the case of arithmetic operators) or throw a python TypeError which will have more 
   understandable behaviour in the client code
3) we might like python clients to be able to \*args and \*\*kwargs
4) might like to implement <pyobject>**<myDObject>



We rely on more recent D compilers which are able to do the following (thx to Adam Ruppe for the hint):

```
mixin(Replace!(q{
        @(__traits(getAttributes, memfn))                 <-- copies the UDAs from memfn to func
        Ret func(T $t, $params) {
            auto dg = dg_wrapper($t, &memfn);
            return dg($ids);
        }
    }, "$params", params, "$fn", __traits(identifier, memfn), "$t",t,
       "$ids",Join!(",",ids)));
```



#### Thus far

* structs are now working
* @\_\_richcmpfunc__ instead of opCmp (so can return Py_RETURN_NOTIMPLEMENTED), also don't need opEquals
* @args, @kwargs  - as function attrs rather than parameter attrs - can't blend with other variables yet
* refactoring and tidyup - naming to reflect cpython api where possible
* keep old d api used in the pyd examples - needs testing
* gives a detailed log as compiling to make it easier to debug


#### WISHLIST

1. any vulnerabilities get discovered by PyCharm in the variable inspector in debug mode - make it easy to prevent this
2. have a clear public api
3. be deployable on pypi

#### Examples

1. see ./examples/BTypes


