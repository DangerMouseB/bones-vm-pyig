from coppertop import cout, AssertRaises


import btypes
print(dir(btypes))


from btypes import BType, BTSum, typesInSum



def testBTypeCreation():
    tUTF8 = BType("utf8")
    print("tUTF8: ", repr(tUTF8))
    assert(repr(tUTF8) == "utf8")
    print("type: ", type(tUTF8))
    print("dir: ", dir(tUTF8))

def testComparisons():
    assert BType("utf8") == BType("utf8")
    assert BType("utf8") != BType("bool")
    assert (BType("utf8"),) == (BType("utf8"),)
    assert BType("utf8") != str
    assert str != BType("utf8")
    assert (BType("utf8"),) != (str,)
    assert (str,) != (BType("utf8"),)
    with AssertRaises(TypeError):
        BType("utf8") < BType("utf8")

def testMySumType():
    s1 = BTSum(BType("utf8"), BType("null"))
    print(s1)
    print(typesInSum(s1))
    s2 = BTSum(BType("utf8"), BType("null"))
    s3 = BTSum(BType("i32"), BType("null"))
    assert s1 == s2
    assert s1 is not s2
    assert s1 != s3

def testAddAndIn():
    s1 = BTSum(BType("utf8"), BType("null"))
    assert(BType("null") in s1)
    assert(s1 not in BType("i32"))
    print(dir(BType("i32")))
    assert '__add__' in dir(BType("i32"))
    print("BType + BType")
    s1 = BType("i32") + BType("null")
    print(s1)
    with AssertRaises(TypeError):
        print("BType + str")
        BType("i32") + str
    with AssertRaises(TypeError):
        print("str + BType")
        str + BType("null")

def testCall():
    num = BType("f64")
    GBP = num("GBP")
    GBPUSD = num(d="GBP", f="USD")
    assert GBP == [("GBP",), {}]
    assert GBPUSD == [(), dict(d="GBP", f="USD")]

def testGetItemEtAl():
    bytes = BBuffer(1)
    bytes[0] = 5
    assert bytes[0] == 5

def testGetAttrEtAl():
    tPerson = BProduct(name=str, age=int);
    penfold = BStruct(tPerson, name="Penfold", age=35)
    assert penfold.name == "Penfold"
    assert penfold.age == 35
    with AssertRaises(TypeError):
        address = penfold.address

def main():
    testBTypeCreation()
    testComparisons()
    testMySumType()
    testAddAndIn()
    testCall()
    # testHashIndex()
    # testGetItemEtAl()
    # testGetAttrEtAl()
    print("passed")


if __name__ == '__main__':
    main()
