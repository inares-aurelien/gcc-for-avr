// https://www.nongnu.org/avr-libc/user-manual/modules.html
#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>

#define PORT_LED 5



int main( void ) {
  DDRB = 1 << PORT_LED;       // Make the pin an output

  while( 1 ) {
    _delay_ms( 500 );
    PORTB ^= 1 << PORT_LED;   // Toggle the LED
  }

  return 0;
}

