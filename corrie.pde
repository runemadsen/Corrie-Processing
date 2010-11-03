/* Imports
_______________________________________________________________ */

import processing.serial.*;

/* Properties
_______________________________________________________________ */

ArrayList rects = new ArrayList();
int rectWidth = 180;
int rectHeight = 180;
int numRows = 3;
int numCols = 4;
Serial myPort;

/* Setup
_______________________________________________________________ */

void setup()
{
  println(Serial.list());
  
  size(770, 570);
  myPort = new Serial(this, Serial.list()[0], 9600);
  int curRow = 0;
  int curCol = 0;  
  
  for(int i = 0; i < numRows * numCols; i++)
  {
     rects.add(new Rectangle(curCol * rectWidth, curRow * rectHeight, rectWidth, rectHeight, curRow, curCol)); 
     
     curCol++;
     
     if(curCol == numCols)
     {
        curCol = 0;
        curRow++;
     }
  }
}

/* Draw
_______________________________________________________________ */

void draw()
{
  background(255);
  
  for(int i = 0; i < rects.size(); i++)
  {
      Rectangle r = (Rectangle) rects.get(i);
      r.isMouseOver();
      r.draw();
      
      if(r.getFadeValue() > 0.0 && r.getFadeValue() < 255.0)
      {
         //println("Row: " + r.getRow() + " Col: " + r.getCol() + " FadeValue: " + r.getFadeValue());
         
         myPort.write("*"); // identifier
         myPort.write( r.getRow());
         myPort.write( r.getCol());
         myPort.write( int(r.getFadeValue()));
      }
  }
}
