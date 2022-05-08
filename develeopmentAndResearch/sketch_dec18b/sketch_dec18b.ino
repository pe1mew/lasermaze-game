*
* Programma: OLED_DEMO.ino
* Versie: 1.0
* Datum: 2017-10-20
*
* Omschrijving: Universal 8bit Graphics Library (https://github.com/olikraus/u8g2/)
*
* Release:
*
* Bugs:
*
*
*/

#include 
#ifdef U8X8_HAVE_HW_SPI
#include
#endif
#ifdef U8X8_HAVE_HW_I2C
#include
#endif

U8G2_SH1106_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, U8X8_PIN_NONE);
// U8X8_SH1106_128X64_NONAME_HW_I2C u8x8(U8X8_PIN_NONE);
/* _R0 = landscape, _R1 .. _R4 = 90, 180, 270 clockwise rotate
_MIRROR = landscape, content mirrored ps. works with setFlipMode.
*/

void setup(void) {
  u8g2.begin();
}

void loop(void) {
  u8g2.clearBuffer(); // clear the internal memory
  u8g2.setFont(u8g2_font_ncenB08_tr); // choose a suitable font
  u8g2.drawStr(0,10,”Hello World!”); // write something to the internal memory
  u8g2.sendBuffer(); // transfer internal memory to the display
  delay(1000);
}
