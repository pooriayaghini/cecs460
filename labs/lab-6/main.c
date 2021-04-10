

//AXI GPIO driver
#include "xgpio.h"

//send data over UART
#include "xil_printf.h"

//receive data over UART
#include "xuartlite_l.h"
//Reset FIFO
#include "xuartlite.h"
//information about AXI peripherals
#include "xparameters.h"
#include <stdio.h>



#define Gpio0ID XPAR_AXI_GPIO_0_DEVICE_ID
#define Gpio1ID XPAR_AXI_GPIO_1_DEVICE_ID
#define Gpio2ID XPAR_AXI_GPIO_2_DEVICE_ID
#define Gpio3ID XPAR_AXI_GPIO_3_DEVICE_ID
#define Gpio4ID XPAR_AXI_GPIO_4_DEVICE_ID
#define Gpio5ID XPAR_AXI_GPIO_5_DEVICE_ID
#define Gpio6ID XPAR_AXI_GPIO_6_DEVICE_ID
#define Gpio7ID XPAR_AXI_GPIO_7_DEVICE_ID
#define Gpio8ID XPAR_AXI_GPIO_8_DEVICE_ID
#define Gpio9ID XPAR_AXI_GPIO_9_DEVICE_ID

//returns a three digit number that was input by the user
//assume the values 0-9 are inputted
int inputThreeDigitNumber() {
	int total = 0;
	xil_printf("\rEnter a number:");
	//Most significant digit (100s place)
	xil_printf("\rMost significant digit");
	total +=  (XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)-48)*100;
	//Second most significant digit (10s place)
	while (XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)!=13);
	xil_printf("\rSecond significant digit");
	total +=  (XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)-48)*10;
	//Third most significant digit (1s place)
	while (XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)!=13);
	xil_printf("\rLeast significant digit");
	total +=  XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)-48;
	return total;
}

int main()
{
	XGpio gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7, gpio8, gpio9;
	XUartLite Uart0;
	int det, inNum;
	char g[4];
	//initialize AXI GPIO
	XGpio_Initialize(&gpio0, Gpio0ID);
	XGpio_Initialize(&gpio1, Gpio1ID);
	XGpio_Initialize(&gpio2, Gpio2ID);
	XGpio_Initialize(&gpio3, Gpio3ID);
	XGpio_Initialize(&gpio4, Gpio4ID);
	XGpio_Initialize(&gpio5, Gpio5ID);
	XGpio_Initialize(&gpio6, Gpio6ID);
	XGpio_Initialize(&gpio7, Gpio7ID);
	XGpio_Initialize(&gpio8, Gpio8ID);
	XGpio_Initialize(&gpio9, Gpio9ID);


	//Set the direction of AXI GPIO
	XGpio_SetDataDirection(&gpio0, 1, 0x00000000); // set Element 0 to output
	XGpio_SetDataDirection(&gpio1, 1, 0x00000000); // set Element 1 to output
	XGpio_SetDataDirection(&gpio2, 1, 0x00000000); // set Element 2 to output
	XGpio_SetDataDirection(&gpio3, 1, 0x00000000); // set Element 3 to output
	XGpio_SetDataDirection(&gpio4, 1, 0x00000000); // set Element 4 to output
	XGpio_SetDataDirection(&gpio5, 1, 0x00000000); // set Element 5 to output
	XGpio_SetDataDirection(&gpio6, 1, 0x00000000); // set Element 6 to output
	XGpio_SetDataDirection(&gpio7, 1, 0x00000000); // set Element 7 to output
	XGpio_SetDataDirection(&gpio8, 1, 0x00000000); // set Element 8 to output
	XGpio_SetDataDirection(&gpio9, 1, 0xFFFFFFFF); // set Determinant to input

	XGpio_DiscreteWrite(&gpio0, 1, 16);
	XGpio_DiscreteWrite(&gpio1, 1, 21);
	XGpio_DiscreteWrite(&gpio2, 1, 23);
	XGpio_DiscreteWrite(&gpio3, 1, 20);
	XGpio_DiscreteWrite(&gpio4, 1, 0);
	XGpio_DiscreteWrite(&gpio5, 1, 20);
	XGpio_DiscreteWrite(&gpio6, 1, 12);
	XGpio_DiscreteWrite(&gpio7, 1, 29);
	XGpio_DiscreteWrite(&gpio8, 1, 18);

	xil_printf("\rInitialize done:");
	//Read from AXI
	det = XGpio_DiscreteRead(&gpio9,1);
	inNum =  inputThreeDigitNumber();
	xil_printf("\rin num: %d", inNum);
	xil_printf("\rDet(A): %d\n", det);
	while (1)
	{

	}
}
