# src/advanced/references/pointer_and_deref.mojo
fn main():
    var val = 42
    var ptr = Pointer[Int](to=val)
    print("The address of val is:", String(ptr))
    print("The value pointed to by ptr is:", ptr[])
