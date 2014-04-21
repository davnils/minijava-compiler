class A
{}

class TheMainClass
{
  public static void main(String [] args)
  {
    //int c = new TheMainClass().something();
    int [] arr = new int[2];

    A a = new A();
    System.out.println(a);
  }

  public int something()
  {
    return 2;
  }
}
