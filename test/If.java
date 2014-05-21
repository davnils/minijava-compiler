class If
{
  public static void main(String [] args)
  {
    if(2 > 5)
    {
      System.out.println(false);
    }
    if(2 == 5)
    {
      System.out.println(false);
    }
    if(5 != 5)
    {
      System.out.println(false);
    }
    if(!(5 >= 5))
    {
      System.out.println(false);
    }
    if(!(5 <= 5))
    {
      System.out.println(false);
    }
    if(1 == 2 == true)
    {
      System.out.println(false);
    }
    if(1 != 1 != false)
    {
      System.out.println(false);
    }
    if(new A() == new A())
    {
      System.out.println(false);
    }
    if(new int [2] == new int [2])
    {
      System.out.println(false);
    }
    System.out.println(true);
  }
}

class A
{
}
