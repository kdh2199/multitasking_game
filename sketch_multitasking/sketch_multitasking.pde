//동환
int a=2; //a=현재 위치(0~4)
int tspeed=3;
int sr=255,sl=255;
float left=random(5),right=random(5), time=random(2);
int leftr=int(left),rightr=int(right),timer=int(time);
int life=2;
int stime=10,s_time;

int xwidth=540, yheight=360;
// xwidth = 미니게임 화면의 가로길이, yheight = 미니게임 화면의 세로길이
int rsy=(yheight*4/7)/5, rsx=xwidth/40 ,blank=(yheight*3/7)/2;
//rsy = 작은 사각형의 세로길이 , rsx = 작은 사각형의 가로길이
//blank = 사각형의끝과 화면끝의 빈공간의 길이(세로)

int tside=rsy-10;
int tx1 = 1080-50, ty1 = blank+rsy/2, tx2 = tx1+(tside)/2*17/10, ty2 = blank+rsy/2-(tside)/2, tx3 = tx1+(tside)/2*17/10, ty3 = blank+rsy/2+(tside)/2;
int tx_1 = 540+50, tx_2 = tx_1-(tside)/2*17/10, tx_3 = tx_1-(tside)/2*17/10;

//수혁
float Rxpos = 100; float Rypos = 361; //조종하는 사각형의 좌표
float speed = 0; float gravity = 0.2; float power = 0; // 조종하는 사각형의 속도, 중력, 힘
float obxpos = 530; float obypos=360; float obspeed = 2; // 장애물
int[] ob = {1, 1, 0}; int i;

//지성
float leftp=0, rightp=0;
float delta= 270; 
float alpha = 150;  
float beta = 377.5;              
int gamma = 1;
int second,s,t,minute=0;

//소중
int Rx=810;
int Ry=540; 
int wp=0; 
int sp=0;
int ap=0;
int dp=0;
int x=550;
int y=370;
int tho=0;

void setup(){
  delay(1000);
  //기본화면
  size(1080,720);
}

void draw(){
  
  if(life==1)
  {
  
  s = second();
  
  //화면(배경)초기화
  strokeWeight(1);
  fill(#7CA3ED);
  stroke(1);
  rect(width/2,0,width/2,height/2);
  strokeWeight(4);
  rect((xwidth+(xwidth/2))-(rsx/2),blank,rsx,rsy*5);
  
  //4번게임
  strokeWeight(1);
  fill(159, 187, 161);
  rect(540,360,1080,720);
  //움직이는 사각형
  strokeWeight(1);
  fill(#69AA78);
  rect(Rx,Ry,25,25);
  Rx = Rx + dp + ap;
  Ry = Ry + wp + sp;
  
  strokeWeight(1);
  fill(195, 176, 209);
  rect(0, height/2, width/2, height/2); //왼쪽 아래 사각형 초기화
  fill(149, 78, 189);
  rect(Rxpos, Rypos, 25, 25); //조종하는 사각형 그리기
  Rypos += speed;
  speed = speed + gravity - power; //속도 정하기
  
  fill(255, 222, 222);                                       // 사각형 색칠
  rect(0, 0, width/2, height/2);                             // 사각형 지정
  fill(255);                                                 // 사각형 색칠
  rect(0,0,width,20);                                        // 시간 나오는 화면
  fill(255, 0, 0);                                           // 구 색칠
  ellipse(delta, 180, 30, 30);                           // 구 소환
  delta = delta + leftp + rightp;
  textSize(18);
  fill(0);
      if(s<second)
        {
          t = 60+s-second;
        }
        else t = s-second;
    
      if(t>=59) minute++;
      text(minute/60 + " : " + t,20,17);
  
  fill(0,0,0);                                               // 막대 색칠
  rect(alpha,150, 12.5, 60);                                 // 좌측 막대 소환
  rect(beta, 150, 12.5, 60);                                 // 우측 막대 소환
  
  alpha -= gamma;                                            // 좌측 막대 속도 조절
  beta -= gamma;                                             // 우측 막대 속도 조절
  if (alpha<=0 && beta <227.5) {                             // 좌측 벽에 닿을 때 조건문
  gamma *= -1;                                               // 막대 방향을 반대로 조절
}                                                            // 좌측막대 조건문 마무리
  if (alpha>=300 && beta>=527.5) {                           // 우측 벽에 닿을 때 조건문
    gamma *= -1;                                             // 막대 방향을 반대로 조절
}                                                            // 우측막대 조건문 마무리
  if (delta-15 <= alpha+11.5 || delta+15 >= beta) {          // 공이 벽에 닿을 때 조건문
    life = 0;                                                // 생명 잃음
  }
   
 
 fill(159, 187, 161);
  strokeWeight(3);
  rect(x,y,70,70);
 //랜덤 사각형
 if(tho==0){
   x=int(random(width/2+30,width-70-30));
   y=int(random(height/2+30,height-70-30));
   tho =1;
   s_time=t;
   stime=10;
 }
 if(Rx+25 >= x && Rx <=x+70 && Ry+25>=y && Ry <= y+70) {
   tho = 0;
 } 
 
 
  fill(0);
 textSize(30);
 text(stime,x+20,y+45);
 
  if(t<50)
 {
   stime=10-(t-s_time);
 }
 
 else
 {
   if(t<=10) t+=60;
   stime=10-(t-s_time);
 }
 
 if(stime<0) life=0;
 
//영역
 if(Rx < 540) {
   Rx =  540;
 } if( Ry < 360) {
    Ry = 360;
 } if(Rx>width-25) {
    Rx= width-25; 
 } if(Ry>height-25) {
    Ry= height-25; 
 } 


  
  //사각형이 바닥에 닿는 경우
  if (Rypos > height-25) {
    speed = 0;
    Rypos = height-25;
  }
  //사각형이 천장에 닿는 경우
  else if (Rypos < height/2) {
    speed = 0;
    Rypos = height/2;
  }
  
  //장애물 그리기
  fill(0);
  for(i=0; i<3; i++) if(ob[i]==1) rect(obxpos, obypos+120*i, 10, 120);
  obxpos -= obspeed;
  if(obxpos<-10) {
    for(i=0; i<3; i++) ob[i]=1;
    ob[int(random(0, 3))] = 0;
    obxpos = 530;
  }
  
  //장애물에 닿았는지 판별
  for(i=0; i<3; i++) 
  if(Rxpos+25>obxpos && Rxpos<=obxpos+5 && ob[i]==1 //x좌표 일치, 장애물 존재, 장애물과 y축 일치 시
  && Rypos+25>=obypos+(120*i) && Rypos<=obypos+120*(i+1)){
      life=0;
  }
  
  //작은사각형
  for(int j=0 ; j<5 ; j++)
  {
    rectMode(CORNER);
    strokeWeight(1);

    if (a==j)
    {
      fill(#1738E8);
      rect((xwidth+xwidth/2)-(rsx/2),blank + rsy*j,rsx,rsy);
    }
    else
    {
      fill(#7CA3ED);
      rect((xwidth+xwidth/2)-(rsx/2),blank + rsy*j,rsx,rsy);
    }
  }
 
  //오른쪽 삼각형 이동
  if(tx1 >= width/2)
  {
      fill(0,0,0,sr);
      noStroke();
      triangle(tx1,ty1+rightr*rsy,tx2,ty2+rightr*rsy,tx3,ty3+rightr*rsy);
      tx1-=tspeed;
      tx2-=tspeed;
      tx3-=tspeed;
  }
  else 
  {
    right = random(5);
    rightr = int(right);
    time=random(2);
    timer=int(time*1000);
    tx1 = 1080-50;
    ty1 = blank+rsy/2;
    tx2 = tx1+(tside)/2*17/10;
    ty2 = blank+rsy/2-(tside)/2;
    tx3 = tx1+(tside)/2*17/10;
    ty3 = blank+rsy/2+(tside)/2;
  }
  
  //오른쪽 삼각형 사라짐
  if(tx2 < (xwidth+(xwidth/2))-(rsx/2)-10) 
  {
    sr-=5;
  }
  else sr=255;
  
  //왼쪽 삼각형 이동
  if(tx_1 <= width)
  {
      fill(0,0,0,sl);
      noStroke();
      triangle(tx_1,ty1+leftr*rsy,tx_2,ty2+leftr*rsy,tx_3,ty3+leftr*rsy);
      tx_1+=tspeed;
      tx_2+=tspeed;
      tx_3+=tspeed;
  }
  else 
  {
    left = random(5);
    leftr = int(left);
    tx_1 = 540+50;
    ty1 = blank+rsy/2;
    tx_2 = tx_1-(tside)/2*17/10;
    ty2 = blank+rsy/2-(tside)/2;
    tx_3 = tx_1-(tside)/2*17/10;
    ty3 = blank+rsy/2+(tside)/2;
  }
    
  //왼쪽 삼각형 사라짐
  if(tx_2 > (xwidth+(xwidth/2))+(rsx/2)+10) sl-=5;
  else sl=255;
  
  //오른쪽 삼각형 죽음
  if( (tx1 <= (xwidth+(xwidth/2))+(rsx/2) && tx1 >= (xwidth+(xwidth/2))-(rsx/2)) ||(tx2 <= (xwidth+(xwidth/2))+(rsx/2) && tx2 >= (xwidth+(xwidth/2))-(rsx/2)))
  {
    if (rightr==a) 
    {
      life=0;
    }
  }
  
  //왼쪽 삼각형 죽음
  if( (tx_1 <= (xwidth+(xwidth/2))+(rsx/2) && tx_1 >= (xwidth+(xwidth/2))-(rsx/2)) ||(tx_2 <= (xwidth+(xwidth/2))+(rsx/2) && tx_2 >= (xwidth+(xwidth/2))-(rsx/2)))
  {
    if (leftr==a) 
    {
      life=0;
    }
  }
  }
  
  else if (life==2)
  {
    fill(#AAAAAA);
    rect(0,0,width,height);
    fill(0);
    textSize(70);
    text("Press mouse to start!!",150,350);
  }
  
  else
  {
    fill(0);
    rect(0,0,width,height);
    fill(255);
    textSize(100);
    text("score : "+(minute*60+t),300,350);
  }
 
}

//이동
void keyPressed () {
  if (key == CODED) {
    if (keyCode == DOWN && a<=3) a++;
    else if(keyCode == UP && a>=1) a--;
  }
  if (key == ' ') power = 0.4; //스페이스 키 누르면 수직위로 힘 가해짐

  if (keyCode ==LEFT) leftp=-5;
  if (keyCode==RIGHT) rightp= 5;
  
  if (key == 'w') wp = -5;
  if (key == 's') sp = +5;
  if (key == 'a') ap = -5;
  if (key == 'd') dp = +5;
}

void keyReleased(){
  if (key == ' ') power = 0; //스페이스 키 때면 힘 사라짐
  if (keyCode ==LEFT) leftp=0;
  if (keyCode==RIGHT) rightp= 0;
  
  if (key == 'a') ap = 0;
   if (key == 'd') dp = 0;
   if (key == 'w') wp = 0;
   if (key == 's') sp = 0;
}

void mousePressed(){
  life=1;
  second = second();
}
