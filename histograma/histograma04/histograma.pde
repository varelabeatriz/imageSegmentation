void setup(){
size(780,600); // 780 px para guardar 3x o valor de 255 (max de pixels)
background (255);
noLoop();
}

void draw(){
  PImage img = loadImage("04.PNG"); //podemos colocar o caminho completo também
  
  int[] histogramaR = new int[256]; 
  int[] histogramaG = new int[256]; 
  int[] histogramaB = new int[256]; 
  
  for(int i = 0; i < 256; i++){
    histogramaR[i] = histogramaG[i] = histogramaB[i] = 0;  
  }
  //objetivo : saber a frequencia em cada um dos canais do RGB para criar o histograma
  for (int  y=0; y< img.height;y++){
    for (int x=0; x < img.width; x++){
      int pos = y*img.width + x;
      int valueRed = int(red(img.pixels[pos]));
      histogramaR[valueRed]++;
      int valueGreen = int(green(img.pixels[pos]));
      histogramaG[valueGreen]++;
      int valueBlue = int(blue(img.pixels[pos]));
      histogramaB[valueBlue]++;
    }}
    
    int histogramaMaxRed = max(histogramaR);
    int histogramaMaxGreen = max(histogramaG);
    int histogramaMaxBlue = max(histogramaB);
     //vetor para receber o maior deles
     int[] histogramaMaior = {histogramaMaxRed,histogramaMaxGreen,histogramaMaxBlue};
     int histogramaMax = max(histogramaMaior);
     
     for (int i =0 ; i<256; i++){
     int y = int(map(histogramaR[i],0,histogramaMax,0,600)); // funcao de escala
     stroke(255,0,0); // contorno
     line(i,600,i,600-y); //sai de 600 e vai ate o valor orientado, por conta do eixo y ser orientado pra baixo
     
     y = int(map(histogramaG[i],0,histogramaMax,0,600)); // funcao de escala
     stroke(0,255,0); // contorno
     line(i+260,600,i+260,600-y); //sai de 600 e vai ate o valor orientado, por conta do eixo y ser orientado pra baixo
     
     y = int(map(histogramaB[i],0,histogramaMax,0,600)); // funcao de escala
     stroke(0,0,255); // contorno
     line(i+520,600,i+520,600-y); //sai de 600 e vai ate o valor orientado, por conta do eixo y ser orientado pra baixo
   
     }   
}
