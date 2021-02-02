For my own sanity, to speed up the IntelliJ D Language plugin, and to be able to follow the intention and design of the pyd code base
I've heavily refactored it - rather too much than can be submitted into a pull request hence a separate repo.


Although currently broken my intention is that all examples in the pyd project should still work using bones-vm-pyig.


Principles
* aliases follow the new syntax
* public templates begin with _
* functions have been renamed to reflect the python c-api, e.g. func would be renamed to richcmpfunc
* variables have been renamed to better indicate scope and usage, e.g. dself and pyself
* nouns wil be denominalised and verb will be de nouned - e.g rather than wrapping a function we generate an adapter

