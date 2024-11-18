ArrayList<Integer> data = new ArrayList<Integer>();
int i = 67;
data.add(i);
data.add(i-2);
data.add(i*22);

for (int d: data){
  println(d, data.size());
}
