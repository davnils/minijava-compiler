class Array
{
  public static void main(String [] args)
  {
    int [] arr;
    //int dummy;
    arr = new int [2];
    arr[0] = 0;
    arr[1] = 1;
    arr = (new A()).produce(arr);
    System.out.println(arr[0]);
    System.out.println(arr[1]);
    //System.out.println(dummy);
  }
}

class A
{
  public int [] produce(int [] arr)
  {
    int tmp;
    tmp = arr[0];
    arr[0] = arr[1];
    arr[1] = tmp;
    return arr;
  }
}
