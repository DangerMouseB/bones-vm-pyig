module bones_vm.pyig.utils;

import std.traits : isAssignable;

import deimos.python.object : PyObject, Py_INCREF;
import deimos.python.pyport : PyAPI_DATA;

 
// compose a tuple without cast-breaking constness
// example:
// ----------
// alias TupleComposer!(immutable(int), immutable(string)) T1;
// T1* t = new T1(1);
// t = t.put!1("foo");
// // t.fields is a thing now
struct TupleComposer(Ts...) {
    Ts fields;

    TupleComposer!Ts* put(size_t i)(Ts[i] val) {
        static if(isAssignable!(Ts[i])){
            fields[i] = val;
            return &this;
        }else{
            return new TupleComposer(fields[0 .. i], val);
        }

    }
}


mixin(PyAPI_DATA!"PyObject _Py_NotImplementedStruct");
private PyObject* Py_NotImplemented = &_Py_NotImplementedStruct;
private PyObject* Py_NewRef(PyObject* p) {Py_INCREF(p); return p;}
PyObject* Py_RETURN_NOTIMPLEMENTED() {return Py_NewRef(Py_NotImplemented);}



/// Converts an identifier from camelCase or PascalCase to snake_case.
string toSnakeCase(in string str) @safe pure {

    import std.algorithm: all, map;
    import std.ascii: isUpper;

    if(str.all!isUpper) return str;

    string ret;

    string convert(in size_t index, in char c) {
        import std.ascii: isLower, toLower;

        const prefix = index == 0 ? "" : "_";
        const isHump =
        (index == 0 && c.isUpper) ||
        (index > 0 && c.isUpper && str[index - 1].isLower);

        return isHump ? prefix ~ c.toLower : "" ~ c;
    }

    foreach(i, c; str) {
        ret ~= convert(i, c);
    }

    return str;
    //return ret;
}

