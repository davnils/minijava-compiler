class Alloc
{
  public static void main(String [] args)
  {
    Alloc A;
    int i;
    A = new Alloc();
    i = 2;
    System.out.println(!(new A()).m1());
    System.out.println(!(new A()).m2());
  }
}

class A
{
  public boolean m1()
  {
    return false;
  }
  public boolean m2()
  {
    return true;
  }
}
