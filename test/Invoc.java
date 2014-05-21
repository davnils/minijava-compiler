class Invoc
{
  public static void main(String [] args)
  {
    int a;
    a = (new A()).test1(2, false);
  }
}

class A
{
  public int test1(int a, boolean b)
  {
    System.out.println(1 < 2 && 2 < 3 && 1 < 0);
    return 1;
  }
}
