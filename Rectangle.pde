class Rectangle
{
   /* Properties
   _______________________________________________________________ */
   
   int _rowNum, _colNum;
   int _w, _h;
   float _x, _y;
   float _fillAlpha = 0;
   float _fillFade = 2;
   boolean _showFill = false;
   
   /* Constructor
   _______________________________________________________________ */
  
   Rectangle(float x, float y, int w, int h, int rowNum, int colNum)
   {
      _x = x;
      _y = y;
      _w = w;
      _h = h;
      _rowNum = rowNum;
      _colNum = colNum;
   } 
   
   /* Draw
   _______________________________________________________________ */
  
   void draw()
   {
      stroke(#04a5e9);
      strokeWeight(3);
      
      if(_showFill)
      {
         _fillAlpha = _fillAlpha < 255 - _fillFade ? _fillAlpha + _fillFade : 255;
        
      }
      else          
      {
         _fillAlpha = _fillAlpha > _fillFade ? _fillAlpha - _fillFade : 0;
      }
      
      fill(#e6157a, _fillAlpha);
      rect(_x, _y, _w, _h);
   }
   
   /* Mouse over
   _______________________________________________________________ */
   
   void isMouseOver()
   {
      if(mouseX >= _x && mouseX <= _x + _w && mouseY >= _y && mouseY <= _y + _h)
      {
        if(!_showFill)
        {
          _showFill = true;
          _fillAlpha = 0;
        }
      }
      else
      {
         _showFill = false; 
      }
   }
   
   /* Getter / Setter
   _______________________________________________________________ */
   
   float getFadeValue()
   {
     return _fillAlpha;
   }
   
   int getRow()
   {
     return _rowNum;
   }  
   
   int getCol()
   {
      return _colNum; 
   }
}
