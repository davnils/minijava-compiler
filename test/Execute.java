class Main
{
  public static void main(String [] args)
  {
    boolean dummy;
    dummy = new Util().test(4, 4);
    //dummy = new Util().test(17, 17);
  }
}

class Util
{
  //list factors for a range of numbers
  public boolean test(int first, int last)
  {
    boolean dummy;
    while(first < last + 1)
    {
      dummy = this.listFactors(first);
      first = first + 1;
    }
    return true;
  }

  //list all factors in 'val'
  public boolean listFactors(int val)
  {
    int i;
    int j;

    i = 1;
    while(i < val)
    {
      /*System.out.println(true);
      System.out.println(i);
      System.out.println(true);*/
      j = 1;
      while(j < val + 1)
      {
        /*System.out.println(false);
        System.out.println(j);
        System.out.println(false);*/
        if(!(i * j < val) && !(val < i * j))
        {
          System.out.println(i);
        }
        else {}
        j = j + 1;
      }
      i = i + 1;
    }
    return true;
  }
}
