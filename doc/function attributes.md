The args kwargs feature relies on recent D compilers that are able to do the following:

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

 (thx to Adam Ruppe for the hint)
 