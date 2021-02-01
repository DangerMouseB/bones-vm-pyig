import std.typecons: Yes, No;

import bones.pyig.awtypes: Modules, Module, Ignore, LibraryName;
import bones.pyig.boilerplate : genPydMainSrcFor;


enum str = genPydMainSrcFor!(
    LibraryName("btypes"),
    // No.alwaysExport doesn't seem to suppress structs so explitily Ignore
    Modules(
        Module("btypes", No.alwaysExport,
            Ignore("BTypeManager"), Ignore("PyTypeObject"), Ignore("PyVarObject"), Ignore("PyAsyncMethods"), Ignore("PyNumberMethods")
            , Ignore("PyObject"), Ignore("PySequenceMethods"), Ignore("PyMappingMethods"), Ignore("PyBufferProcs"), Ignore("PyMethodDef")
            , Ignore("PyMethodDef"), Ignore("PyMemberDef"), Ignore("PyGetSetDef"), Ignore("PyMethodDef")
        )
    ),
);


mixin(str);

